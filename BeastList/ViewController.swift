//
//  ViewController.swift
//  BeastList
//
//  Created by Vikash Loomba on 9/4/15.
//  Copyright © 2015 Vikash Loomba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Model
    var tasks = Task.all()
    
    //Text field variable
    @IBOutlet weak var insertTaskField: UITextField!
    
    //table view variable
    @IBOutlet weak var tableView: UITableView!
    
    //Insert button pressed action
    @IBAction func insertButtonPressed(sender: UIButton) {
        let newItem = insertTaskField.text
        if newItem != "" {
            let task = Task(obj: newItem!)
            task.save()
            insertTaskField.text = ""
            tasks = Task.all()
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Functions for the table view that are needed
    
    //how many cells will we be implementing?
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    //for each row in the view, what kind of cell is displayed
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //dequeue the cell from our storyboard
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        
        //If the cell has a text label, set it to the model that is corresponding the to the row in the tasks array
        cell.textLabel?.text = tasks[indexPath.row].objective
        
        //return the cell so the table view can draw it
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        tasks.removeAtIndex(indexPath.row)
        tasks = Task.all()
        tableView.reloadData()
    }


}

