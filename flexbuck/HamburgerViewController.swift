//
//  HamburgerViewController.swift
//  flexbuck
//
//  Created by Charles Hieger on 6/24/15.
//  Copyright (c) 2015 Charles Hieger. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    @IBOutlet weak var studentListTabView: UIView!
    
    @IBOutlet weak var newStudentView: UIView!
    
    @IBOutlet weak var studentListView: UIView!
    
    @IBOutlet weak var arrowImageView: UIImageView!
    // tab bar stuff
    var tabSlide: String! = "right"
    var initialX: CGFloat!
    
    
    var newStudentViewController: UIViewController!
    var studentListViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        newStudentViewController = storyboard.instantiateViewControllerWithIdentifier("NewStudentViewController") as! NewStudentViewController
        
        studentListViewController = storyboard.instantiateViewControllerWithIdentifier("StudentListViewController") as! StudentListViewController
        
        
        addChildViewController(newStudentViewController)
        newStudentViewController.view.frame = newStudentView.bounds
        newStudentView.addSubview(newStudentViewController.view)
        newStudentViewController.didMoveToParentViewController(self)
        
        addChildViewController(studentListViewController)
        studentListViewController.view.frame = studentListView.bounds
        studentListView.addSubview(studentListViewController.view)
        studentListViewController.didMoveToParentViewController(self)
        
        // setup studentList tab view
        studentListTabView.frame.origin.x = view.frame.origin.x
        initialX = studentListView.center.x
        
        //                newStudentViewController.view.alpha = 0
        //                UIView.animateWithDuration(0.3, animations: { () -> Void in
        //                    self.newStudentViewController.view.alpha = 1
        //                    }) { (Bool) -> Void in
        //                        //important so iOS knows that the view controller has appeared
        //                        self.newStudentViewController.didMoveToParentViewController(self)
        
                
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}

    @IBAction func onTapNewStudent(sender: UITapGestureRecognizer) {
        println("you tapped new student")
        
        if tabSlide == "right" {
            newStudentView.alpha = CGFloat(0)
            UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
            self.studentListView.center.x = 500
            self.studentListView.alpha = CGFloat(0.5)
            self.studentListTabView.center.x = 416
            self.studentListTabView.alpha = CGFloat(0.5)
            self.arrowImageView.transform = CGAffineTransformMakeRotation(CGFloat(180 * M_PI / 180))
                
                self.newStudentView.alpha = CGFloat(1)

        }, completion: nil)
            tabSlide = "left"
        } else {
            UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
                self.studentListView.center.x = self.initialX
                self.studentListView.alpha = CGFloat(1.0)
                self.studentListTabView.center.x = self.initialX
                self.arrowImageView.transform = CGAffineTransformMakeRotation(0)
                self.studentListTabView.alpha = CGFloat(1.0)
                
                }, completion: nil)
            tabSlide = "right"
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
