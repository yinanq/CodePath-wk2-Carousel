//
//  WelcomeViewController.swift
//  CodePath-wk2-Carousel
//
//  Created by Yinan iMac on 2/13/16.
//  Copyright © 2016 YinanLearningSwift. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonParentView: UIView!
    
    var page = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        
        buttonParentView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // https://guides.codepath.com/ios/Using-UIPageControl
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        // Get the current page based on the scroll offset
        page = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        // hide page control and show button on page4
        if page == 3 {
            pageControl.hidden = true
            UIView.animateWithDuration(0.5, animations: {
                self.buttonParentView.alpha = 1
            })
        }
    }
    
    // hide button and show page control when scrolling away from page4
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        if page == 3 {
            UIView.animateWithDuration(0.2, animations: {
                self.buttonParentView.alpha = 0
            })
            pageControl.hidden = false
        }
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
