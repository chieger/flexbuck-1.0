//
//  CoreValueViewController.swift
//  flexbuck
//
//  Created by Charles Hieger on 6/23/15.
//  Copyright (c) 2015 Charles Hieger. All rights reserved.
//

import UIKit

class CoreValueViewController: UIViewController {
    
    
    var type: String!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if type == "flexbuck" {
            view.backgroundColor = UIColor.blueColor()
            textLabel.text = type
        } else {
            view.backgroundColor = UIColor.redColor()
            textLabel.text = type
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    }
    


