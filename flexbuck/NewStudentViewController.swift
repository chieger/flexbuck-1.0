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
    
    var newStudentAddedView: UIImageView!
    
    @IBOutlet weak var studentAddedView: UIView!
    
    @IBOutlet weak var firstNameAddedLabel: UILabel!
    
    @IBOutlet weak var lastNameAddedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentAddedView.hidden = true
        studentAddedView.alpha = CGFloat(0)
        
        
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
            self.studentAddedView.hidden = false
            self.firstNameAddedLabel.text = self.firstNameField.text
            self.lastNameAddedLabel.text = self.lastNameField.text
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.studentAddedView.alpha = 1.0
                }, completion: nil)
            
            
            
        
        }
    }
    
    @IBAction func onTapCongratulations(sender: UITapGestureRecognizer) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.studentAddedView.alpha = 0
            self.firstNameField.text = ""
            self.lastNameField.text = ""
            self.advisorField.text = ""
            self.gradeField.text = ""
            self.idField.text = ""
        }) { (Bool) -> Void in
            self.studentAddedView.hidden = true
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
