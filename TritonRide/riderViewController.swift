//
//  riderViewController.swift
//  TritonRide
//
//  Created by Ann Chih on 6/7/16.
//  Copyright © 2016 UCSD. All rights reserved.
//

import UIKit
import Firebase


class riderViewController: UITableViewController {
    
    var postList:[Post] = []
    let ref = FIRDatabase.database().reference()

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            print("peeee")
            let cell = tableView.dequeueReusableCellWithIdentifier("postsCell", forIndexPath: indexPath) as! PostCell
            //let posting = postList[indexPath.row] as Post
            //cell.postings = posting
            return cell    }
    
}
