//
//  FirstViewController.swift
//  To Do List App
//
//  Created by Ashley Jelks on 12/30/15.
//  Copyright © 2015 Ashley Jelks. All rights reserved.
//

import UIKit

var toDoList = [String]()
// toDoList is a global variable (of an array of strings) accessible anywhere in the app. This variable is used to refer to the items in the todo list.



class FirstViewController: UIViewController, UITableViewDelegate {
    
    //Reminder here we add a TableView Delegate so the Table View can be controlled from the First View Controller

    
    @IBOutlet var toDoListTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
            
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
        
        //To permanently store the To Do List data we are going to sync the items in the toDoList array with the contents of NSUserDefaults
        
        //It first checks IF it exists, and only if it does, does the value of the array toDoList get assigned to NSUserDefaults
        
        //This code restores whatever is stored in NSUserDefaults whenever user reopens app
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //The number of rows in the section == the number of items in the To Do List
        
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
        //return the indexPath row at that cell
        
        /*

        Prototype cells are a way to layout the look and feel of a cell inside a table view, they allow us to get a representation of how things are going to work when the application runs and data is passed into the table. These Prototype cells allow for complex layout beyond the basic table view.
        */
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    //Here this ^^ is a function that is called when the user attempts to edit the UITableView, by deleting an item in the tableView (or in the to do list) by swiping to the left
    
        
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row)
            
            //UITableViewCellEditingStyle == a swipe to the left to delete. If a user does swipe left, this code removes the item from the toDoList array
        }
        
        
        NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        
        // This updates the data saved in NSUserDefaults to remove the item the user swiped off the to-do list
        
        
        toDoListTable.reloadData()
        //This updates the table without the removed item and updates the indices of the items in the array
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData()
        
        /* Here we need to call a function to update the view everytime the TableView page appears so that items that are added and removed to the ToDoList appear */
        
        
    }


}

