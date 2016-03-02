//
//  StatsViewController.swift
//  To-Do List App
//
//  Created by Maaz Uddin on 3/1/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var taskCounter: UILabel!
    var counter = 0
    
    override func viewDidLoad() {
        taskCounter.text = String(counter)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
