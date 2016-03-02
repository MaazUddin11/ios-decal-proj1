//
//  FirstViewController.swift
//  To-Do List App
//
//  Created by Maaz Uddin on 2/23/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {

    @IBOutlet weak var statsButton: UIBarButtonItem!
    
    var tasks = [Task]()
    
    func isWithin24Hours(date: NSDate) -> Bool {
        let yesterday = NSDate(timeIntervalSinceNow: -3600*24)
        return yesterday.earlierDate(date) == yesterday
    }
    
    
    
    
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
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle , reuseIdentifier: "Default")
        cell.textLabel!.text = tasks[indexPath.row].name
        if tasks[indexPath.row].finished == false {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        else if tasks[indexPath.row].finished == true {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        //cell.detailTextLabel!.text = "Test Text"
        return cell
    }
    
    // Check or uncheck a task
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        if tasks[indexPath.row].finished == false {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            tasks[indexPath.row].finished = true
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
            tasks[indexPath.row].finished = false
        }
        tasks[indexPath.row].date = NSDate()
        
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            tasks.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
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
    

}

