//
//  TaskManager.swift
//  To-Do List App
//
//  Created by Maaz Uddin on 2/23/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class Task: NSObject {

    var name = ""
    var finished = false
    var date = NSDate()
    
    init(name: String) {
        self.name = name
        self.finished = false
        self.date = NSDate()
    }
    
}
