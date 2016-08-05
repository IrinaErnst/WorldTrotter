//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Irina Kalashnikova on 8/2/16.
//  Copyright © 2016 Irina Kalashnikova. All rights reserved.
//

import UIKit
import WebKit

class WebViewController:UIViewController, WKNavigationDelegate{
    
    var webView: WKWebView!
    var webURL = "https://timirina.com/"
    
    override func loadView() {
        //super.loadView()
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView!
    }
    
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(true)
        //navigationController!.navigationBar.hidden = false
        
        print("MapViewController appear its view")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("WebViewController loaded its view")
        let url = NSURL(string: webURL)!
        webView.loadRequest(NSURLRequest(URL: url))
        webView.allowsBackForwardNavigationGestures = true
        
        
        
        /*
        /* Create our preferences on how the web page should be loaded */
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        
        /* Create a configuration for our preferences */
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        /* Now instantiate the web view */
        webView = WKWebView(frame: self.view.frame, configuration: configuration)
        
        
        if let theWebView = webView {
            print(theWebView)
            print(webView)
            print("WebViewController THEWEBVIEW")
            let url = NSURL(string: self.webURL)
            let urlRequest = NSURLRequest(URL: url!)
            
            theWebView.loadRequest(urlRequest)
            
            webView.allowsBackForwardNavigationGestures = true
            
            
            theWebView.navigationDelegate = self
            self.view.addSubview(theWebView)
            self.view.sendSubviewToBack(theWebView)
            print(theWebView)
        }*/
    }
    /*
    /* Start the network activity indicator when the web view is loading */
    func webView(webView: WKWebView,didStartProvisionalNavigation navigation: WKNavigation){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    /* Stop the network activity indicator when the loading finishes */
    func webView(webView: WKWebView,didFinishNavigation navigation: WKNavigation){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webView(webView: WKWebView,
                 decidePolicyForNavigationResponse navigationResponse: WKNavigationResponse,decisionHandler: ((WKNavigationResponsePolicy) -> Void)){
        //print(navigationResponse.response.MIMEType)
        decisionHandler(.Allow)
        
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }*/
}
