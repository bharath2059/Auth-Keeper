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

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      // Use Firebase library to configure APIs
    FirebaseApp.configure()
    return true
  }
}

@main
struct Auth_keeperApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationView(){
                ContentView()
            }
        }
    }
}
