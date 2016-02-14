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
    
    let email = "yinan@snooker.com"
    let password = "147"
    
    
    // https://guides.codepath.com/ios/Using-UIAlertController
    // 1. create aler controller
    let missingEmailAlertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
    let missingPasswordAlertController = UIAlertController(title: "Password Required", message: "Please enter your password", preferredStyle: .Alert)
    let missingBothAlertController = UIAlertController(title: "Email and Password Required", message: "Please enter your email and password", preferredStyle: .Alert)
    let wrongEmailOrPasswordAlertController = UIAlertController(title: "Invalid Email or Password", message: "Please enter correct email and password", preferredStyle: .Alert)
    // 2. create action
    let okAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        // handle response here.
    }
    
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
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffsetY = -120
        
        // https://guides.codepath.com/ios/Using-UIAlertController
        // 3. add action to the alert controller
        missingEmailAlertController.addAction(okAction)
        missingPasswordAlertController.addAction(okAction)
        missingBothAlertController.addAction(okAction)
        wrongEmailOrPasswordAlertController.addAction(okAction)
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
        print("keyboardWillHide")
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
        print("sign in button touch up inside")
//        signInButton.selected = true
        
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            print("missing email or/and password")
            if passwordField.text!.isEmpty == false {
                print("missing email")
                // https://guides.codepath.com/ios/Using-UIAlertController
                // 4. missing email alert
                presentViewController(missingEmailAlertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            } else if emailField.text!.isEmpty == false{
                print("missing password")
                // https://guides.codepath.com/ios/Using-UIAlertController
                // 4. missing password alert
                presentViewController(missingPasswordAlertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            } else {
                print("missing both email and password")
                // https://guides.codepath.com/ios/Using-UIAlertController
                // 4. missing password alert
                presentViewController(missingBothAlertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            }
        } else {
            // show activity indicator
            signInButtonActivityIndicator.startAnimating()
            
            // check email and password
            if emailField.text == email && passwordField.text == password {
                print("sign in success")
                // delay x seconds, then run code
                delay(2, closure: { () -> () in
                    self.signInButtonActivityIndicator.stopAnimating()
//                    self.signInButton.selected = false
                    self.performSegueWithIdentifier("signInSegue", sender: nil)
                })
            } else {
                print("wrong email or/and password")
                // delay x seconds, then run code
                delay(2, closure:  { () -> () in
                    self.signInButtonActivityIndicator.stopAnimating()
                    // https://guides.codepath.com/ios/Using-UIAlertController
                    // 4. Show the UIAlertController
                    self.presentViewController(self.wrongEmailOrPasswordAlertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                })
            }
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
