//
//  LoginViewController.swift
//  flexbuck
//
//  Created by Charles Hieger on 6/23/15.
//  Copyright (c) 2015 Charles Hieger. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameField.text, password: passwordField.text) {
            (user: PFUser?, error:NSError?) -> Void in
            if user != nil {
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            } else {
                println("error \(error)")
            }
            }
        
    }
    
    @IBAction func didPressSignUp(sender: AnyObject) {
    
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            
            if success {
                println("You succeeded!")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            } else {
                println("error \(error)")
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
