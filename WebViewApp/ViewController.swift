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
        myWebView.uiDelegate = self // indicator 를 위해서 설정 했지만 안된다. 역시 책데로 따라 해야 한단 말인가?
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
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
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
        print("file load")
        let myHtmlBundle = Bundle.main
        let filePath = myHtmlBundle.path(forResource: "htmlWebview", ofType: "html")
        loadWebPage(filePath!)
    }
    @IBAction func btnGoHtml(_ sender: UIButton) {
        let htmlString = """
            <h1> HTML String </h1> <p> String 변수를 이용한 웹페이지 </p>
            <p> <a href="http://2sam.net/">2sam</a>으로 이동 </p>
        """
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
}

