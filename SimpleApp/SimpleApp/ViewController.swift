//
//  ViewController.swift
//  SimpleApp
//
//  Created by Nguyen Hoang Tuan on 7/4/15.
//  Copyright (c) 2015 NHT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    let URLPath = "http://www.google.com"
    var myCustomBackButtonItem: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        loadAddressURL(URLPath)
        addBackButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    func addBackButton() {
        var myBackButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        myBackButton.addTarget(self, action: "backHistory:", forControlEvents: UIControlEvents.TouchUpInside)
        myBackButton.setTitle("Back", forState: UIControlState.Normal)
        myBackButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        myBackButton.sizeToFit()
        myCustomBackButtonItem = UIBarButtonItem(customView: myBackButton)
        self.navigationItem.leftBarButtonItem  = myCustomBackButtonItem
    }
    
    @IBAction func homeButtonAction(sender: AnyObject) {
        loadAddressURL(URLPath)
    }
    
    func backHistory(sender: UIButton) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
}

