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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

