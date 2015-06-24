//
//  StudentListViewController.swift
//  flexbuck
//
//  Created by Charles Hieger on 6/23/15.
//  Copyright (c) 2015 Charles Hieger. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        return cell
    }

}
