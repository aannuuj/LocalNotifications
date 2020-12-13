//
//  Notifications.swift
//  LocalNotifications
//
//  Created by Hariom Palkar on 13/12/20.
//

import Foundation

// model

struct Notification {
    // you can add more details like images, custom sounds and more, dont forget to make change in LocalNotificationManager class if you make changes here.
    
    var id: String
    var title: String
    var datetime: DateComponents
    var repeats : Bool
}

func notifications(hour: Int, minute: Int, second: Int){
   
    let now = Date()
    var components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)
    
    let hour = hour
    let min = minute
    let sec = minute
    
    components.hour = hour
    components.minute = min
    components.second = sec

    print(hour)
    
    let date = Calendar.current.date(from: components)!

    let triggerDaily = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
    
    // passing data
    let notificationData : [Notification] = [
        Notification(id: "reminder-1", title: "Remember to get Shwarma!", datetime: DateComponents(calendar: Calendar.current, year: 2020, month: 12, day: 13, hour: 10, minute: 20), repeats: false),
        Notification(id: "reminder-3", title: "Send postcard to dad", datetime: DateComponents(calendar: Calendar.current, year: 2020, month: 12, day: 13, hour: 20, minute: 25), repeats: true),
        
        // you can replace the username with user defaults to personalize the experience
        // check out my repo for generic user defaults
        
        Notification(id: "reminder-2", title: "Hey user! Time for something!!", datetime: triggerDaily, repeats: true)
    ]
    
    // nested function
    
    func scheduleNotification() {
    let manager = LocalNotificationManager()
    manager.notifications = notificationData
    manager.schedule()
    }
    
    scheduleNotification()
    
}
