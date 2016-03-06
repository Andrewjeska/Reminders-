//
//  TaskManager.swift
//  Reminders++
//
//  Created by Michael Anderjaska on 3/5/16.
//  Copyright © 2016 Michael Anderjaska. All rights reserved.
//

import UIKit

var TaskMgr : TaskManager = TaskManager()

struct task{
    var name = ""
    //var desc = ""
   
    var time = ""
}

class TaskManager: NSObject {
    
    var tasks : [task] = []
    
    func addTask(name: String, time: String){
        let t = task(name: name,  time: time)
        tasks.append(t)
        
        
        
               
        

        
    }
    
}
