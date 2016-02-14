//
//  IntroViewController.swift
//  CodePath-wk2-Carousel
//
//  Created by Yinan iMac on 2/13/16.
//  Copyright © 2016 YinanLearningSwift. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 320, height: 1136)
        
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // about the 4 methods below: "If you Command-click on the UIScrolLViewDelegate, it will pull up the list of events for the UIScrollView. Choose the event that you want, and add the function to your view controller file. Be sure to remove the text optional and also delete the underscore symbol." (source: https://guides.codepath.com/ios/Using-UIScrollView#registering-for-scroll-events )
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
    }
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return scrollView
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
