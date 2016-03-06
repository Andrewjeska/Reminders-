//  SecondViewController.swift
//  Reminders++
//
//  Created by Michael Anderjaska on 3/5/16.
//  Copyright © 2016 Michael Anderjaska. All rights reserved.
//

import UIKit



class SecondViewController: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet var myDatePicker: UIDatePicker!
    @IBOutlet var txtTask: UITextField!
    
    
    
    //UIDatePicker
    
    
    var chosenTime: String = ""
    
    
    func datePickerChanged(datePicker:UIDatePicker){
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        chosenTime = dateFormatter.stringFromDate(datePicker.date)
        
        print(datePicker.date)
        
        
        print(chosenTime)
        
        
    }
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       myDatePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true
        
    }
    
    @IBAction func scheduleLocal(sender: AnyObject, fireTime: NSDate) {
        let notification = UILocalNotification()
        
        //notification.fireDate = fireTime

        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.alertBody = "You really suck for not completing your goals!! :("
        notification.alertAction = "be awesome!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustomField1": "w00t"]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    //events
    
    @IBAction func buttonAddTask(sender: UIButton){
        TaskMgr.addTask(txtTask.text!, time: chosenTime)
        print(myDatePicker.date)
        
        scheduleLocal(self, fireTime: myDatePicker.date)
        
        self.view.endEditing(true)
        txtTask.text = ""
        self.tabBarController?.selectedIndex = 0
        
        
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    func makeIntoArray(str: String) -> [Character]{
        var result = [Character]()
        
        
        for char in str.characters{
            
            result.append(char)
        }
        
        return result
    }

    

    
    
}

