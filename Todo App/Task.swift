//
//  Task.swift
//  Todo App
//
//  Created by Jacob Pashman on 7/6/18.
//  Copyright © 2018 jacobpashman. All rights reserved.
//

import Foundation

class Task {
    var title: String
    var description: String
    var lastEdited: String
    var completed: Bool
    
    init(title: String, description: String) {
        self.title = title
        self.lastEdited = Task.getTodayString()
        self.completed = false
        self.description = description
    }
    
    func setTime() {
        self.lastEdited = Task.getTodayString()
    }
    
    class func getTodayString() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.month,.day,.year], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        
        let today_string = String(month!) + "-" + String(day!) + "-" + String(year!)
        
        return today_string
        
    }
}
