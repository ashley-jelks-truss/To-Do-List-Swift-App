//
//  SecondViewController.swift
//  To Do List App
//
//  Created by Ashley Jelks on 12/30/15.
//  Copyright © 2015 Ashley Jelks. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet var item: UITextField!
    
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDoList.append(item.text!)
        //adds items to the array toDoList when user presses button
        
        item.text = ""
        //clears the text stored in the variable "item" so users can add additional items to the array
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        //^ This code updates NSUserDefaults everytime a user saves an item to the toDoList variable
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Below is the code to make the keyboard removable by tapping outside the keyboard
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    //Below is the code that allows the user to close the keyboard by pressing Done/Return
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        item.resignFirstResponder()
        return true
    }


}

