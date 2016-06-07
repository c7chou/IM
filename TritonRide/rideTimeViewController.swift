//
//  ridePostViewController.swift
//  Uber
//
//  Created by Ann Chih on 6/4/16.
//  Copyright © 2016 Ann Chih. All rights reserved.
//

import UIKit
import Firebase

class rideTimeViewController: UITableViewController  {
    //var times:[rideTime] = timesData
    let p = Post(driver: "J", time: "12:00", spots: "5", location: "123213")
    var postList:[Post] = []
    let ref = FIRDatabase.database().reference()
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //self.tableView.registerNib(PostCell, forCellReuseIdentifier: "postCell")
        self.tableView.registerClass(UITableViewCell.self , forCellReuseIdentifier: "postCellid")
        self.ref.observeEventType(.Value, withBlock: { (snapshot) in
            print(snapshot.value)
            print("EL")
            for item in snapshot.children{
                let driver = item.value!["driver"] as! String
                //print(driver)
                let time = item.value!["time"] as! String
                //print(time)
                let spots = item.value!["spotAvail"] as! String
                //print(spots)
                let location = item.value!["location"] as! String
                //print(location)
                let newPost = Post(driver: driver, time: time, spots: spots, location: location)
                self.postList.append(newPost!)
                //print(self.postList)
            }
        })
        print("DOINGSOM")
        
        self.tableView.reloadData()
        
        
    }
  
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            print("I'm in")
            let cell = tableView.dequeueReusableCellWithIdentifier("postCellid", forIndexPath: indexPath) as! PostCell
            
            let posting = postList[indexPath.row] as Post
            cell.postings = posting
            print(cell.postings.driver)
            print(cell.postings.time)
            print(cell.postings.location)
            print(cell.postings.spots)
            return cell
    }
    
    

}
