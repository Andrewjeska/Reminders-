//
//  FirstViewController.swift
//  Reminders++
//
//  Created by Michael Anderjaska on 3/5/16.
//  Copyright © 2016 Michael Anderjaska. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblTasks: UITableView!
    
    
    @IBAction func registerLocal(sender: AnyObject) {
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerLocal(self)
       
        
        // scheduleLocal(self)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //returning to view
    
    override func viewWillAppear(animated: Bool) {
        tblTasks.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return TaskMgr.tasks.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle , reuseIdentifier: "_")
        
        cell.textLabel!.text = TaskMgr.tasks[indexPath.row].name
        cell.detailTextLabel!.text = "by " + TaskMgr.tasks[indexPath.row].time

        
        //cell.detailTextLabel!.text = TaskMgr.tasks[indexPath.row].desc
        
        
        return cell
        
    }
    
    //deleting
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool{
    
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if(editingStyle == .Delete){
            TaskMgr.tasks.removeAtIndex(indexPath.row)
            tblTasks.reloadData()
        }
    }

    
    
}
