//
//  AppDelegate.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Enable IQKeyboard
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 10
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        IdleTimer.shared.startTimer()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        IdleTimer.shared.startTimer()
    }

}
