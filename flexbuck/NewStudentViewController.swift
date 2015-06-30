//
//  NewStudentViewController.swift
//  flexbuck
//
//  Created by Charles Hieger on 6/24/15.
//  Copyright (c) 2015 Charles Hieger. All rights reserved.
//

import UIKit

class NewStudentViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var advisorField: UITextField!
    
    @IBOutlet weak var gradeField: UITextField!
    
    @IBOutlet weak var idField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // add screen edge pan gesture recognizer
        //        var screenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: "didPanNewStudent:")
        //        view.userInteractionEnabled = true
        //        screenEdgePanGestureRecognizer.edges = .Top
        //        view.addGestureRecognizer(screenEdgePanGestureRecognizer)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didPanNewStudent(screenEdgePanGestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        
        if screenEdgePanGestureRecognizer.state == UIGestureRecognizerState.Began {
            println("began")
        } else if screenEdgePanGestureRecognizer.state == UIGestureRecognizerState.Changed {
            println("in progress")
        } else if screenEdgePanGestureRecognizer.state == UIGestureRecognizerState.Ended {
            println("ended")
        }
        
    }
   
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onTapNewStudent(sender: UITapGestureRecognizer) {
    
        var student = PFObject(className: "Student")
        
        student["firstName"] = firstNameField.text
        student["lastName"] = lastNameField.text
        student["advisor"] = PFUser.currentUser()
        student["grade"] = gradeField.text
        student["id"] = idField.text
        
        student.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Congratulations, You added a new student")
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
