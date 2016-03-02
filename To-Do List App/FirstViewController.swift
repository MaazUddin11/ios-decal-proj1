//
//  FirstViewController.swift
//  To-Do List App
//
//  Created by Maaz Uddin on 2/23/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {
    
    var tasks = [Task]()
    var numberOfCompletedTasks = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table View Delegate
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // Keep cells updated (including with their checkmarks)
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        deleteOver24HrTasks()
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle , reuseIdentifier: "Default")
        cell.textLabel!.text = tasks[indexPath.row].name
        if tasks[indexPath.row].finished == false {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        else if tasks[indexPath.row].finished == true {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        return cell
    }
    
    // Check or uncheck a task
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        if tasks[indexPath.row].finished == false {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            tasks[indexPath.row].finished = true
            numberOfCompletedTasks += 1
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
            tasks[indexPath.row].finished = false
            numberOfCompletedTasks -= 1
        }
        tasks[indexPath.row].date = NSDate().timeIntervalSince1970
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // Function to delete tasks
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            tasks.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Stats" {
            let statsView: StatsViewController = segue.destinationViewController as! StatsViewController
            statsView.counter = numberOfCompletedTasks
        }
    }
    
    // Receive info from SecondViewController and add to table
    @IBAction func unwindToTableViewController(segue:UIStoryboardSegue) {
        if segue.identifier == "Save" {
            let sourceView: SecondViewController = segue.sourceViewController as! SecondViewController
            let newTask: Task = sourceView.task
            tasks.append(newTask)
            self.tableView.reloadData()
        }
    }
    
    
    // Function to delete tasks that have been checked off for more than 24 hours
    func deleteOver24HrTasks() {
        let currTime = NSDate().timeIntervalSince1970
        let oneDay = Double(60*60*24)
        for i in 0 ..< tasks.count {
            if tasks[i].finished {
                if (currTime - tasks[i].date) >= oneDay {
                    tasks.removeAtIndex(i)
                }
            }
        }
    }
    

}

