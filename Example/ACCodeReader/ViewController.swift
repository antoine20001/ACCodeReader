//
//  ViewController.swift
//  ACCodeReader
//
//  Created by antoine.cointepas@orange.fr on 03/25/2017.
//  Copyright (c) 2017 antoine.cointepas@orange.fr. All rights reserved.
//

import UIKit
import ACCodeReader
import AVFoundation

class ViewController: UIViewController, ACCodeReaderViewDelegate {

    @IBOutlet weak var readerView: ACCodeReaderView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readerView.delegate = self
        readerView.supportCodeType = [AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeDataMatrixCode, AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeAztecCode, AVMetadataObjectTypeITF14Code, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeCode39Mod43Code, AVMetadataObjectTypeInterleaved2of5Code]
//        readerView.activeRect = CGRect(x: 0, y: readerView.frame.size.height/2, width: readerView.frame.size.width, height: readerView.frame.size.height)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func didReceiveCode(code: String, codeType: String) {
        if codeType == AVMetadataObjectTypeEAN13Code {
            resultLabel.text = "EAN13 : \(code)"
        } else {
            resultLabel.text = "\(codeType) : \(code)"
        }
    }
    
    func errorDetected(error: NSError) {
        resultLabel.text = "\(error.description)"
    }
}

