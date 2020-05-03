//
//  WebViewViewController.swift
//  ios_task_mehedi_hasan
//
//  Created by Md. Mehedi Hasan on 2/5/20.
//  Copyright © 2020 Mehedihasan290. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var webKit: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webKit.load(URLRequest(url: URL(string: "https://www.google.com")!))
        
    }
    

   

}
