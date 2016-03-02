//
//  SecondViewController.swift
//  To-Do List App
//
//  Created by Maaz Uddin on 2/23/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var taskName: UITextField!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var task: Task = Task(name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Adds task to the array of tasks and resers the text boxes and moves
    // us to the First View
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender === self.saveButton {
            self.task = Task(name: taskName.text!)
        }
    }
    
    // Touching away from the keyboard removes keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    // Return button removes keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

