//
//  WebViewController.swift
//  MyCarVersionTwo
//
//  Created by mac on 5/30/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:"https://www.google.com")
        let request=URLRequest(url:url!)
        webview.load(request)
        
    }
 
    override var prefersStatusBarHidden: Bool{
        return true
    }
 

}
