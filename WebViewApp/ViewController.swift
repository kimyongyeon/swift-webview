//
//  ViewController.swift
//  WebViewApp
//
//  Created by yongyeon kim on 2020/07/25.
//  Copyright © 2020 yongyeon kim. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler  {
    
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        initWebView()
        loadWebPage("http://www.naver.com")
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if (message.name == "hello") {
            let data = message.body
            print(data as! String)
        } else if (message.name == "test") {
            let data = message.body
            print(data as! String)
        }
    }
    
    func initWebView() {
        let contentContoller = WKUserContentController()
        let config = WKWebViewConfiguration()
        contentContoller.add(self, name: "hello")
        contentContoller.add(self, name: "test")
        
        config.userContentController = contentContoller
        
        myWebView = WKWebView(frame: CGRect.init(x: 0, y: 86, width: 375, height: 404), configuration: config)
    }
    
    func loadWebPage (_ url: String) {
        
        view.addSubview(myWebView)
        
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        
        myWebView.load(myRequest)
        
        myWebView.uiDelegate = self
        myWebView.navigationDelegate = self
    }

    @IBAction func btnGotoUrl(_ sender: UIButton) {
    }
    @IBAction func btnGoFile(_ sender: UIButton) {
    }
    @IBAction func btnGoHtml(_ sender: UIButton) {
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
    }
}

