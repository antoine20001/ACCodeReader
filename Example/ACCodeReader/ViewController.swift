//
//  ViewController.swift
//  ACCodeReader
//
//  Created by antoine.cointepas@orange.fr on 03/25/2017.
//  Copyright (c) 2017 antoine.cointepas@orange.fr. All rights reserved.
//

import UIKit
import ACCodeReader

class ViewController: UIViewController, ACCodeReaderViewDelegate {

    @IBOutlet weak var readerView: ACCodeReaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readerView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func codeReaderFindBarcodeEAN13(_ code: String) {
        
    }
    
    func codeReaderScanningNotPossible() {
        
    }

}

