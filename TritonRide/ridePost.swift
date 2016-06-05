//
//  rideDriver.swift
//  Uber
//
//  Created by Ann Chih on 6/4/16.
//  Copyright © 2016 Ann Chih. All rights reserved.
//

import UIKit

struct ridePost{
    
    var name: String?
    var plate: String?
    var spotAvail: Int?
    var time: String?
    
    init(name: String?, plate: String?, spotAvail:Int, time:String) {
        self.name = name
        self.plate = plate
        self.spotAvail = spotAvail
        self.time = time
    }
}
