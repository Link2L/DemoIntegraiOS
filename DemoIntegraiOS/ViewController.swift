//
//  ViewController.swift
//  DemoIntegraiOS
//
//  Created by Armando Cervantes on 28/01/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    private var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // WebView
        let webViewPrefs=WKPreferences()
            webViewPrefs.javaScriptEnabled=true
            webViewPrefs.javaScriptCanOpenWindowsAutomatically=true
        
        let webViewConf=WKWebViewConfiguration()
        webViewConf.preferences=webViewPrefs
        webView=WKWebView(frame:view.frame,configuration:webViewConf)
        webView.autoresizingMask=[.flexibleWidth,.flexibleHeight]
        view.addSubview(webView)
        
        let defaults=UserDefaults.standard
        if let usr = defaults.string(forKey:"username"){
            if let pss = defaults.string(forKey:"password"){
                load(url: "https://pwa.bwigo.com?key=1&keycode=login&usr="+usr+"&psw="+pss)
            }
            print("usuario correcto")
        }else{
            print("usuario y password invalido")
        }
        
        
        
        
        
    }

    private func load(url:String){
        webView.load(URLRequest(url:URL(string:url)!))
    }
}

