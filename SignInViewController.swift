//
//  SignInViewController.swift
//  CodePath-wk2-Carousel
//
//  Created by Yinan iMac on 2/13/16.
//  Copyright © 2016 YinanLearningSwift. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signInButtonActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var buttonInitialY: CGFloat!
    var buttonOffsetY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        scrollView.delegate = self
        
        // https://guides.codepath.com/ios/Registering-for-Keyboard-Events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide", name: UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffsetY = -120
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // https://guides.codepath.com/ios/Registering-for-Keyboard-Events
    
    func keyboardWillShow(notification: NSNotification!){
        print("keyboardWillShow")
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffsetY
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    func keyboardWillHide(notfication: NSNotification!){
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    @IBAction func signInTouchUpInside(sender: AnyObject) {
        // https://guides.codepath.com/ios/Creating-a-Log-In-Screen#step-2-configure-text-field-properties
        
        // 1. give feedback as soon as TouchUpInside:
//        signInButton.selected = true
        signInButtonActivityIndicator.startAnimating()
        
        // 2. depends on if sign in succeeds:
        if emailField.text == "learning2code@yinandesign.com" && passwordField.text == "147"{
            // if sign in succeeds:
            print("sign in success")
            
            //delay x seconds, then run code between {}:
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.signInButtonActivityIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
//                self.signInButton.selected = false
                // perform the Segue to the next screen.
                self.performSegueWithIdentifier("signInSegue", sender: nil)
            })
        }else{
            // if sign in fails:
            print("sign in fail")
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.signInButtonActivityIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
//                self.signInButton.selected = false
                // Create and Show UIAlertController...see guide, Using UIAlertController
            })
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
