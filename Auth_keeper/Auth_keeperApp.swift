//
//  Auth_keeperApp.swift
//  Auth_keeper
//
//  Created by Bharath Mamidi on 2022-11-20.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AppDelegate: UIResponder,  UIApplicationDelegate, UNUserNotificationCenterDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      UNUserNotificationCenter.current().delegate = self
      // Use Firebase library to configure APIs
    FirebaseApp.configure()
   
    return true
  }
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification,
                                    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            print("notification")
        completionHandler([.banner, .badge, .sound])

        }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("notification")
        completionHandler([.sound, .badge])
    }
    
}



@main
struct Auth_keeperApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationView(){
                SplashScreen()
            }
        }
    }
}
