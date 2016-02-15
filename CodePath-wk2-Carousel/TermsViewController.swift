//
//  TermsViewController.swift
//  CodePath-wk2-Carousel
//
//  Created by Yinan iMac on 2/14/16.
//  Copyright © 2016 YinanLearningSwift. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    
    @IBOutlet weak var termsWebView: UIWebView!
    
    let termsURL = "https://www.dropbox.com/terms?mobile=1"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // https://guides.codepath.com/ios/Using-UIWebView
        // Convert the url String to a NSURL object.
        let requestURL = NSURL(string:termsURL)
        // Place the URL in a URL Request.
        let request = NSURLRequest(URL: requestURL!)
        // Load Request into WebView.
        termsWebView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneTouchUpInside(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion:nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
