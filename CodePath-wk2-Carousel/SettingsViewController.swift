//
//  SettingsViewController.swift
//  CodePath-wk2-Carousel
//
//  Created by Yinan iMac on 2/14/16.
//  Copyright © 2016 YinanLearningSwift. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    
    // https://guides.codepath.com/ios/Using-UIAlertController#using-action-sheets-style
    // 1. create alert controller
    let signOutAlertController = UIAlertController(title: nil, message: "Are you want to sign out?", preferredStyle: .ActionSheet)
    // 2. create action buttons
    var signOutAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
        // "The destructive style options shows the button text in red."
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        // code for what happens after tapping the button. leaving it empty lets the button dismiss the view.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        settingsScrollView.contentSize = settingsImageView.image!.size
        
        // https://guides.codepath.com/ios/Using-UIAlertController#using-action-sheets-style
        // 3. give action buttons actions aka code for what happens after tapping the button. leaving it empty lets the button dismiss the view.
        signOutAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
            // code for what happens after tapping the button. leaving it empty lets the button dismiss the view.
            self.performSegueWithIdentifier("signOutSegue", sender: self)
        }
        // 4. add action buttons to alert controllers
        signOutAlertController.addAction(cancelAction)
        signOutAlertController.addAction(signOutAction)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonTouchUpInside(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func signOutButtonTouchUpInside(sender: AnyObject) {
        // https://guides.codepath.com/ios/Using-UIAlertController#using-action-sheets-style
        // 4. present alert controller
        presentViewController(signOutAlertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
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
