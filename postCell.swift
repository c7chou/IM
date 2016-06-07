//
//  postsCell.swift
//
//
//  Created by Jerry Chou on 6/6/16.
//
//

import UIKit

class postCell: UITableViewCell {
    @IBOutlet weak var driverSlot: UILabel!
    @IBOutlet weak var timeSlot: UILabel!
    @IBOutlet weak var spotSlot: UILabel!
    @IBOutlet weak var locationSlot: UILabel!
    
    var postings:Post!{
        didSet{
            print("lalala")
            driverSlot.text = postings.driver
            timeSlot.text = postings.time
            spotSlot.text = String(postings.spots)
            locationSlot.text = postings.location
            
        }
        
    }
}