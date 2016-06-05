//
//  rideDriver.swift
//  Uber
//
//  Created by Ann Chih on 6/4/16.
//  Copyright © 2016 Ann Chih. All rights reserved.
//

import UIKit

struct rideDriver{
    
    var name: String?
    var plate: String?
    var spotAvail: Int?
    
    init(name: String?, plate: String?, spotAvail:Int) {
        self.name = name
        self.plate = plate
        self.spotAvail = spotAvail
    }
}
