//
//  ViewControllerWebviewDelegate.swift
//  SimpleApp
//
//  Created by Nguyen Hoang Tuan on 7/4/15.
//  Copyright (c) 2015 NHT. All rights reserved.
//

extension ViewController {
    
    func loadAddressURL(urlString: String){
        self.title = urlString
        let requestURL = NSURL(string: URLPath)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    
    // MARK: Webview Delegate
    func webViewDidStartLoad(webView: UIWebView) {
        let currentUrlString = (webView.request?.URL!.absoluteString)!
        self.title = currentUrlString;
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        NSLog("Webview finished load")
        let currentUrlString = (webView.request?.URL!.absoluteString)!
        NSLog(currentUrlString)
        if currentUrlString.rangeOfString("google.com") != nil {
            NSLog("Going to hide the navigation bar! "+currentUrlString)
            //THIS IS WHERETHE NAVIGATION BAR WILL BE HIDDEN
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            NSLog("Going to show the navigation bar! "+currentUrlString)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            //THIS IS WHERE IS NEED THE NAVIGATION BAR TO BE SHOWN
        }
        SVProgressHUD.dismiss()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        SVProgressHUD.dismiss()
    }
    
}
