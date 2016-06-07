//
//  ridePostViewController.swift
//  Uber
//
//  Created by Ann Chih on 6/4/16.
//  Copyright © 2016 Ann Chih. All rights reserved.
//

import UIKit
import Firebase

class rideTimeViewController: UITableViewController {
    //var times:[rideTime] = timesData
    
    var postList:[Post] = []
    let ref = FIRDatabase.database().reference()
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource=self
        self.ref.observeEventType(.Value, withBlock: { (snapshot) in
            print(snapshot.value)
            for item in snapshot.children{
                let driver = item.value!["driver"] as! String
                let time = item.value!["time"] as! String
                let spots = item.value!["spotAvail"] as! String
                let location = item.value!["location"] as! String
                let newPost = Post(driver: driver, time: time, spots: spots, location: location)
                self.postList.append(newPost!)
            }
        })
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.ref.observeEventType(.Value, withBlock: { snapshot in
            //for user in snapshot.children{
               // var userName = user
            
         
            
        })
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("peeee")
        let cell = tableView.dequeueReusableCellWithIdentifier("postsCell", forIndexPath: indexPath) as! PostCell
        let posting = postList[indexPath.row] as Post
        cell.postings = posting
        return cell
    }

    
    

}
