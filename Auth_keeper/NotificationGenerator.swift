//
//  NotificationGenerator.swift
//  Auth_keeper
//
//  Created by Bharath Mamidi on 2022-12-06.
//

import Foundation
import UserNotifications

class NotificationGenerator {
    static func generateNotification(title : String, desc : String){
        requestAuthorization()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = desc
        
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        
        dateComponents.weekday = 4
        dateComponents.hour = 18
        
     //   let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        
        //create request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger2)
        
        //schedule request
        
        let notificationCeneter = UNUserNotificationCenter.current()
        notificationCeneter.add(request) {(error) in
            //handle errors
            if let error = error {
                // error
                print("error in authorization \(error)")
            }
        }
    }
    
    static func requestAuthorization() {
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) {granted, error in
            
            if let error = error {
                // error
                print("error in authorization \(error)")
            }
            //enable or disable features
        }
    }
}
