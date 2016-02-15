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
    @IBOutlet weak var introImageView: UIImageView!
    
    @IBOutlet weak var tile1ImageView: UIImageView!
    @IBOutlet weak var tile2ImageView: UIImageView!
    @IBOutlet weak var tile3ImageView: UIImageView!
    @IBOutlet weak var tile4ImageView: UIImageView!
    @IBOutlet weak var tile5ImageView: UIImageView!
    @IBOutlet weak var tile6ImageView: UIImageView!
    // for tiles animation
    var xOffsets : [CGFloat] = [-30, 55, -66, 5, -180, -15]
    var yOffsets : [CGFloat] = [-285, -240, -415, -430, -480, -500]
    var scales : [CGFloat] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [CGFloat] = [-10, 25, 10, 15, -15, -10]
    let maxScrollPosition = 568
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // https://guides.codepath.com/ios/Using-UIScrollView#step-2-set-the-content-size
        scrollView.contentSize = introImageView.image!.size
        
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // about the methods below: "If you Command-click on the UIScrolLViewDelegate, it will pull up the list of events for the UIScrollView. Choose the event that you want, and add the function to your view controller file. Be sure to remove the text optional and also delete the underscore symbol." (source: https://guides.codepath.com/ios/Using-UIScrollView#registering-for-scroll-events )
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        
        // get the current scroll position
        let scrollPosition = Float(scrollView.contentOffset.y)
        print("scroll offset: \(Int(scrollPosition))")
        
        // generate animation target values based on current scroll position from step above
        let tx1 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: xOffsets[0], r2Max: 0)
        let ty1 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: yOffsets[0], r2Max: 0)
        let scale1 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: scales[0], r2Max: 1)
        let rotation1 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: rotations[0], r2Max: 0)
        let rotation1Converted = CGFloat(Double(rotation1) * M_PI/180)
        
        let tx2 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: xOffsets[1], r2Max: 0)
        let ty2 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: yOffsets[1], r2Max: 0)
        let scale2 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: scales[1], r2Max: 1)
        let rotation2 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: rotations[1], r2Max: 0)
        let rotation2Converted = CGFloat(Double(rotation2) * M_PI/180)
        let tx3 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: xOffsets[2], r2Max: 0)
        let ty3 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: yOffsets[2], r2Max: 0)
        let scale3 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: scales[2], r2Max: 1)
        let rotation3 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: rotations[2], r2Max: 0)
        let rotation3Converted = CGFloat(Double(rotation3) * M_PI/180)
        let tx4 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: xOffsets[3], r2Max: 0)
        let ty4 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: yOffsets[3], r2Max: 0)
        let scale4 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: scales[3], r2Max: 1)
        let rotation4 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: rotations[3], r2Max: 0)
        let rotation4Converted = CGFloat(Double(rotation4) * M_PI/180)
        let tx5 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: xOffsets[4], r2Max: 0)
        let ty5 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: yOffsets[4], r2Max: 0)
        let scale5 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: scales[4], r2Max: 1)
        let rotation5 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: rotations[4], r2Max: 0)
        let rotation5Converted = CGFloat(Double(rotation5) * M_PI/180)
        let tx6 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: xOffsets[5], r2Max: 0)
        let ty6 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: yOffsets[5], r2Max: 0)
        let scale6 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: scales[5], r2Max: 1)
        let rotation6 = convertValue(CGFloat(scrollPosition), r1Min: 0, r1Max: CGFloat(maxScrollPosition), r2Min: rotations[5], r2Max: 0)
        let rotation6Converted = CGFloat(Double(rotation6) * M_PI/180)
        
        // do the animations using target values from step above
        // https://guides.codepath.com/ios/Using-View-Transforms
        tile1ImageView.transform = CGAffineTransformMakeTranslation(tx1, ty1)
        tile1ImageView.transform = CGAffineTransformScale(tile1ImageView.transform, scale1, scale1)
        tile1ImageView.transform = CGAffineTransformRotate(tile1ImageView.transform, rotation1Converted)
        
        tile2ImageView.transform = CGAffineTransformMakeTranslation(tx2, ty2)
        tile2ImageView.transform = CGAffineTransformScale(tile2ImageView.transform, scale2, scale2)
        tile2ImageView.transform = CGAffineTransformRotate(tile2ImageView.transform, rotation2Converted)
        tile3ImageView.transform = CGAffineTransformMakeTranslation(tx3, ty3)
        tile3ImageView.transform = CGAffineTransformScale(tile3ImageView.transform, scale3, scale3)
        tile3ImageView.transform = CGAffineTransformRotate(tile3ImageView.transform, rotation3Converted)
        tile4ImageView.transform = CGAffineTransformMakeTranslation(tx4, ty4)
        tile4ImageView.transform = CGAffineTransformScale(tile4ImageView.transform, scale4, scale4)
        tile4ImageView.transform = CGAffineTransformRotate(tile4ImageView.transform, rotation4Converted)
        tile5ImageView.transform = CGAffineTransformMakeTranslation(tx5, ty5)
        tile5ImageView.transform = CGAffineTransformScale(tile5ImageView.transform, scale5, scale5)
        tile5ImageView.transform = CGAffineTransformRotate(tile5ImageView.transform, rotation5Converted)
        tile6ImageView.transform = CGAffineTransformMakeTranslation(tx6, ty6)
        tile6ImageView.transform = CGAffineTransformScale(tile6ImageView.transform, scale6, scale6)
        tile6ImageView.transform = CGAffineTransformRotate(tile6ImageView.transform, rotation6Converted)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        // return a view that will be scaled. if delegate returns nil, nothing happens
        return introImageView
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
