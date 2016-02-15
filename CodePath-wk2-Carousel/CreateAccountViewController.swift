//
//  CreateAccountViewController.swift
//  CodePath-wk2-Carousel
//
//  Created by Yinan iMac on 2/14/16.
//  Copyright © 2016 YinanLearningSwift. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textImageView: UIImageView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var createButton: UIButton!    
    @IBOutlet weak var fieldParentView: UIView!
    
    var animation = true
    
    var buttonInitialY: CGFloat!
    var buttonOffsetY: CGFloat!
    
    let firstName = "Yinan"
    let lastName = "Qiu"
    let email = "yinan@snooker.com"
    let password = "147"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 80
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffsetY = -130
        
        // register keyboard events and tie them to funcs 
        // https://guides.codepath.com/ios/Registering-for-Keyboard-Events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    // content appear animation starting values
    override func viewWillAppear(animated: Bool) {
        if animation == true {
            // Set initial transform values x% of original size
            let transform = CGAffineTransformMakeScale(0.9, 0.97)
            // Apply the transform properties of the views
            fieldParentView.transform = transform
            // Set the alpha properties of the views to transparent
            fieldParentView.alpha = 0
        }
    }
    
    // content appear animation duration and end values
    override func viewDidAppear(animated: Bool) {
        if animation == true {
            //Animate the code within over 0.3 seconds...
            UIView.animateWithDuration(0.3) { () -> Void in
                // Return the views transform properties to their default states.
                self.fieldParentView.transform = CGAffineTransformIdentity
                // Set the alpha properties of the views to fully opaque
                self.fieldParentView.alpha = 1
            }
            // turn off animation to prevent it from happening again after coming back from TermsViewController
            animation = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        print("keyboardWillShow")
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffsetY
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        print("keyboardWillHide")
        buttonParentView.frame.origin.y = buttonInitialY
        scrollView.contentOffset.y = 0
    }
    
    @IBAction func scrollViewTapGestureRecognizer(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // toggle checkbox button next to "Agree to Terms"
    @IBAction func agreeButtonTouchUpInside(sender: AnyObject) {
//        if agreeButton.selected == false {
//            agreeButton.selected = true
//        } else {
//            agreeButton.selected = false
//        }
        agreeButton.selected = !agreeButton.selected
    }
    
    @IBAction func backButtonTouchUpInside(sender: AnyObject) {
        // nav back with reverse push animation
        navigationController?.popToRootViewControllerAnimated(true)
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
