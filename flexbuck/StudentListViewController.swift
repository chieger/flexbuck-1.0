//
//  StudentListViewController.swift
//  flexbuck
//
//  Created by Charles Hieger on 6/23/15.
//  Copyright (c) 2015 Charles Hieger. All rights reserved.
//

import UIKit

//Here we conform to the StudentCellDelegate protocol (we implement the method that the protocol declares)
class StudentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, StudentCellDelegate, UIGestureRecognizerDelegate {
    
    
    func gestureRecognizer(UIGestureRecognizer,shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //var students = ["Juneau", "Kingsley", "Charlene", "Rachel", "Brezen", "Sophie", "Chris", "Amanda", "Michaelangela", "student 1", "Student 2"]
    
    // pull students from parse
    var students: [PFObject]! = []
    
    var type: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "onTimer", userInfo: nil, repeats: true)
        
        // executes timer
        timer.fire()
        
    }
    
    func onTimer() {
        
        // this sets up a query in the class "messege"
        var query = PFQuery(className: "Student")
        
        
        // limits scope of query to only items where the key in the "user" column is the same as the key of the current user.
        query.whereKey("grade", equalTo: "6")
        
        // this looks for everything in the Parse "doc"
        query.findObjectsInBackgroundWithBlock { (students: [AnyObject]?, error: NSError?) -> Void in
            
            // the as! object makes sure that the types match. AnyObject converted to PFObject, the type that we initialized "messeges as
            
            self.students = students as! [PFObject]
            
            // tells the table view there is new data and to reload
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("StudentCell") as! StudentCell
        var student = students[indexPath.row]
        cell.firstNameLabel.text = student["firstName"] as? String
        cell.lastNameLabel.text = student["lastName"] as? String
        
        //Setting a variable (conceptually called a "delegate") on the cell
        cell.studentCellDelegate = self
        
        return cell
    }
    
    //This method is called by the studentCell
    func studentCellChangedToState(cell: StudentCell, state: StudentCellState) {
        switch (state)
        {
        case .Flexbuck:
            println("Push your flexbuck segue")
            type = "flexbuck"
            performSegueWithIdentifier("coreValueSegue", sender: nil)
        case .FlexbuckQuery:
            println("Push your flexbuck query segue")
        case .NTI:
            println("Push your NTI  segue")
            type = "nti"
            performSegueWithIdentifier("coreValueSegue", sender: nil)
        case .NTIQuery:
            println("Push your NTI Query segue")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("im about to Segue to another view controller")
        var coreValueViewController = segue.destinationViewController as! CoreValueViewController
        
        coreValueViewController.type = type
    }
}