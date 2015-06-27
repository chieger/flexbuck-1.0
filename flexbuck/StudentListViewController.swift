//
//  StudentListViewController.swift
//  flexbuck
//
//  Created by Charles Hieger on 6/23/15.
//  Copyright (c) 2015 Charles Hieger. All rights reserved.
//

import UIKit

//Here we conform to the StudentCellDelegate protocol (we implement the method that the protocol declares)
class StudentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, StudentCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var students = ["Juneau", "Kingsley", "Charlene", "Rachel", "Brezen", "Sophie"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
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
        cell.studentNameLabel.text = student
        
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
        case .FlexbuckQuery:
                println("Push your flexbuck query segue")
        case .NTI:
            println("Push your NTI query segue")
        case .NTIQuery:
                println("Push your NTI segue")
        }
    }
}
