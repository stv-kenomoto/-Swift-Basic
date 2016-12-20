//
//  WebViewController.swift
//  LinkCollectionOfProgrammingLanguages
//
//  Created by kokoki on 2016/05/05.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var webView: UIWebView!
    
    // MARK: - Properties
    
    var urlRequest: NSURLRequest?
    var urlTitle: String?
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = self.urlTitle
        self.webView.loadRequest(self.urlRequest!)
    }
    
    // MARK: - Action
    
    @IBAction func doTapBackButton(sender: AnyObject) {
        self.webView.goBack()
    }

    @IBAction func doTapForwardButton(sender: AnyObject) {
        self.webView.goForward()
    }
    
    @IBAction func doTapReloadButton(sender: AnyObject) {
        self.webView.reload()
    }
}
