//
//  ACCodeReaderView.swift
//  Pods
//
//  Created by Antoine Cointepas on 25/03/2017.
//
//

import AudioToolbox
import UIKit
import AVFoundation

public protocol ACCodeReaderViewDelegate: class {
    func didReceiveCode(code: String, codeType: String)
    func errorDetected(error: NSError)
}

open class ACCodeReaderView: UIView {
    
    public var startWaitDuration : Double = 3
    public weak var delegate: ACCodeReaderViewDelegate?
    
    var session: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    public var supportCodeType : [String] = []
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Create a session object.
        session = AVCaptureSession()
        createVideoInput()
        createVideoOutput()
        
        // Add previewLayer and have it show the video data.
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = self.layer.bounds
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.layer.addSublayer(previewLayer)
        
        // Begin the capture session.
        
        session.startRunning()
    }
    
    private func createVideoInput() {
        // Set the captureDevice.
        let videoCaptureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        // Create input object.
        let videoInput: AVCaptureDeviceInput?
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        // Add input to the session.
        if (session.canAddInput(videoInput)) {
            session.addInput(videoInput)
        } else {
            self.delegate?.errorDetected(error: NSError(domain: "ACCodeReader", code: 0, userInfo: ["message": "ACCodeReaderView createVideoInput ScanningNotPossible"]))
        }
    }
    
    private func createVideoOutput() {
        // Create output object.
        let metadataOutput = AVCaptureMetadataOutput()
        
        // Add output to the session.
        if (session.canAddOutput(metadataOutput)) {
            session.addOutput(metadataOutput)
            
            // Send captured data to the delegate object via a serial queue.
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            // Set barcode type for which to scan: EAN-13.
            metadataOutput.metadataObjectTypes = self.supportCodeType
            
        } else {
            self.delegate?.errorDetected(error: NSError(domain: "ACCodeReader", code: 1, userInfo: ["message": "ACCodeReaderView createVideoOutput ScanningNotPossible"]))
        }
    }
    
    deinit {
        delegate = nil
        if (session?.isRunning == true) {
            session.stopRunning()
        }
    }
    
    override open func removeFromSuperview() {
        super.removeFromSuperview()
        if (session?.isRunning == true) {
            session.stopRunning()
        }
    }
    
    
    
    public func vibrate() {
        if #available(iOS 10.0, *) {
            if let value = UIDevice.current.value(forKey: "_feedbackSupportLevel") as? Int, value == 2 {
                let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
                feedbackGenerator.prepare()
                feedbackGenerator.impactOccurred()
            } else {
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            }
        } else {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
}

extension ACCodeReaderView: AVCaptureMetadataOutputObjectsDelegate {
    open func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        // Get the first object from the metadataObjects array.
        if let barcodeData = metadataObjects.first as? AVMetadataMachineReadableCodeObject  {
            self.delegate?.didReceiveCode(code: barcodeData.stringValue, codeType: barcodeData.type)

            // Vibrate the device to give the user some feedback.
            self.vibrate()
            
            // Avoid a very buzzy device.
            session.stopRunning()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + startWaitDuration, execute: {
                self.session.startRunning()
            })
        } else {
            self.delegate?.errorDetected(error: NSError(domain: "ACCodeReaderView", code: 2, userInfo: ["message": "AVCaptureMetadataOutputObjectsDelegate captureOutput error"]))
        }
    }
}
