//
//  StudentCell.swift
//  flexbuck
//
//  Created by Charles Hieger on 6/23/15.
//  Copyright (c) 2015 Charles Hieger. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var studentNameLabel: UILabel!
    
    var segue: String!
    
    
    // initialize colors
    var lightGrey: UIColor!
    var green: UIColor!
    var red: UIColor!
    var yellow: UIColor!
    var peach: UIColor!
    var blue: UIColor!

    //initialize icons
    @IBOutlet weak var happyImageView: UIImageView!
    @IBOutlet weak var sadImageView: UIImageView!
    @IBOutlet weak var queryImageView: UIImageView!
    
    // initial center for cellView
    var initialCenter: CGPoint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // add pan gesture recognizer
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "didPanStudent:")
        cellView.userInteractionEnabled = true
        cellView.addGestureRecognizer(panGestureRecognizer)
        
        // setup colors
        lightGrey = UIColor(red: 229/255, green: 230/255, blue: 233/255, alpha: 1.0)
        green = UIColor(red: 98/255, green: 214/255, blue: 80/255, alpha: 1.0)
        red = UIColor(red: 229/255, green: 62/255, blue: 39/255, alpha: 1.0)
        yellow = UIColor(red: 233/255, green: 189/255, blue: 38/255, alpha: 1.0)
        peach = UIColor(red: 207/255, green: 150/255, blue: 99/255, alpha: 1.0)
        blue = UIColor(red: 0, green: 224/255, blue: 221/255, alpha: 1.0)
    
    setupIcons()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func didPanStudent(panGestureRecognizer: UIPanGestureRecognizer) {
        var translation = panGestureRecognizer.translationInView(contentView)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            initialCenter = cellView.center
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            cellView.center.x = initialCenter.x + translation.x
            
            
            switch (translation.x) {
                //flexbuck
            case 61...260:
                contentView.backgroundColor = green
                queryImageView.alpha = 0.0
                happyImageView.alpha = 1.0
                happyImageView.center.x = cellView.frame.origin.x - 30
                
                //flexbuck query
            case 261...400:
                contentView.backgroundColor = blue
                happyImageView.alpha = 0.0
                queryImageView.alpha = 1.0
                queryImageView.center.x = cellView.frame.origin.x - 30
                //NTI
            case (-260)...(-61):
                contentView.backgroundColor = red
                queryImageView.alpha = 0.0
                sadImageView.alpha = 1.0
                sadImageView.center.x = cellView.frame.origin.x + cellView.frame.width + 30
                //NTI query
            case (-400)...(-261):
                contentView.backgroundColor = yellow
                sadImageView.alpha = 0.0
                queryImageView.alpha = 1.0
                queryImageView.center.x = cellView.frame.origin.x + cellView.frame.width + 30
            default:
                contentView.backgroundColor = lightGrey
                happyImageView.alpha = translation.x / 60
                sadImageView.alpha = -(translation.x / 60)
            }

            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            switch (translation.x) {
                
                //flexbuck
            case 61...260:
                slideOffScreenHide(550)
        
                //flexbuck query
            case 261...400:
                slideOffScreenHide(550)
                
                // NTI
            case (-260)...(-61):
                slideOffScreenHide(-220)
                
                // NTI query
            case (-400)...(-261):
                slideOffScreenHide(-220)
                
            default:
                UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
                    self.cellView.center = self.initialCenter
                    
                    }, completion: nil)
            }
        }
    }
    func slideOffScreenHide(endPoint: CGFloat) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.cellView.center.x = endPoint
            self.happyImageView.center.x = self.cellView.frame.origin.x - 30
            self.sadImageView.center.x = self.cellView.frame.origin.x + self.cellView.frame.width + 30
            if endPoint > 0 {
                self.queryImageView.center.x = self.cellView.frame.origin.x - 30
            } else {
                self.queryImageView.center.x = self.cellView.frame.origin.x + self.cellView.frame.width + 30
            }
            
            }, completion: { (Bool) -> Void in
                
                println("now we should segue")
                })
        
        
    }
    func setupIcons () {
        happyImageView.alpha = 0.0
        happyImageView.center = CGPoint(x: 30, y: contentView.frame.height / 2)
        queryImageView.alpha = 0.0
        queryImageView.center.y = contentView.frame.height / 2
        sadImageView.alpha = 0.0
        sadImageView.center = CGPoint(x: contentView.frame.width - 30 ,y: contentView.frame.height / 2)
        //        listImageView.alpha = 0.0
        //        listImageView.center.y = messegeView.frame.height / 2
    }

}
