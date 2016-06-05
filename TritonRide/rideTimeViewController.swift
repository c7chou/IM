//
//  ridePostViewController.swift
//  Uber
//
//  Created by Ann Chih on 6/4/16.
//  Copyright © 2016 Ann Chih. All rights reserved.
//

import UIKit

class rideTimeViewController: UITableViewController {
    var times:[rideTime] = timesData
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("timeCell", forIndexPath: indexPath)
            
            let time = times[indexPath.row] as rideTime
            cell.textLabel?.text = time.time
            return cell
    }
    
    

}
