//
//  ridePost.swift
//  TritonRide
//
//  Created by Ann Chih on 6/5/16.
//  Copyright © 2016 UCSD. All rights reserved.
//

import UIKit
import Firebase
class ridePostViewController: UITableViewController {
    var ridePosts:[ridePost] = postData
    
    @IBOutlet weak var spotField: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    
    var posts: ridePost?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerChanged()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("error no good")
    }
    @IBAction func cancelPostView(segue:UIStoryboardSegue) {
    }
    
    @IBAction func savePostDetail(sender:UIButton) {
        let spots = spotField.text
        let time = datePicker.date
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.stringFromDate(time)
        
        let dict:Dictionary<String,AnyObject>=["spot":spots!,"time":dateString]
        //let ref = FIRDatabase.database().reference().child("ridePost").child("time").setValue(spots)
        //ref.setValue(dict)
        // Write data to Firebase
        /*if let postViewController = segue.sourceViewController as? ridePostViewController {
            
            //add the new player to the players array
            if let ridePost = postViewController.posts{
                ridePosts.append(ridePost)
                print(ridePost.spotAvail)
                print(ridePost.time)
                //update the tableView
                let indexPath = NSIndexPath(forRow: ridePosts.count-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }*/
    }

    func datePickerChanged () {
        timeLabel.text = NSDateFormatter.localizedStringFromDate(datePicker.date, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            toggleDatepicker()
        }
    }
    var datePickerHidden = false
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if datePickerHidden && indexPath.section == 0 && indexPath.row == 1 {
            return 0
        }
        else {
            return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }
    func toggleDatepicker() {
        datePickerHidden = !datePickerHidden
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    @IBAction func datePickerValue(sender: UIDatePicker) {
        datePickerChanged()
    }



        
}
