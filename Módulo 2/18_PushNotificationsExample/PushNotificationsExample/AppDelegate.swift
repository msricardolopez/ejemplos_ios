//
//  AppDelegate.swift
//  PushNotificationsExample
//
//  Created by Ricardo López on 19/05/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

/*
 Key ID:
 R8L5PH754X
 */

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let userNotificationCenter = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //let center = UNUserNotificationCenter.current()
        userNotificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            // Enable or disable features based on authorization.
            print("Listo APNS")
        }
        userNotificationCenter.delegate = self
        application.registerForRemoteNotifications()
        
        //let action = UNNotificationAction(identifier:"reply", title:"Reply",options:[])
        //let category = UNNotificationCategory(identifier: "io.swifting.notification-request", actions: [action],
                                              //minimalActions: [action], intentIdentifiers: [], options: [])
        //UNUserNotificationCenter.current().setNotificationCategories([category])
        let actionChange = UNNotificationAction(identifier: "set", title: "Colocar", options: [])
        let actionOmit = UNNotificationAction(identifier: "omit", title: "Omitir", options: [])
        let category = UNNotificationCategory(identifier: "com.ms.categorytest", actions: [actionChange, actionOmit], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

// MARK: - Notifications

extension AppDelegate {

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Convert token to string
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("Token: \(deviceTokenString)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("APNs registration failed: \(error)")
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        print("Notificación recibida: \(userInfo)")
        if let message = userInfo["message"] as? String {
            print("Recibimos el mensaje: \(message)")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UPDATE_UI"), object: message)
        }
    }
}

// MARK: - UNUserNotificationCenterDelegate

extension AppDelegate: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Test: \(response.actionIdentifier)")
        
        if response.actionIdentifier == "set" {
            print("Ponemos el mensaje")
            let userInfo = response.notification.request.content.userInfo
            if let message = userInfo["message"] as? String {
                print("Recibimos el mensaje: \(message)")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UPDATE_UI"), object: message)
            }
        }
        else if response.actionIdentifier == "omit" {
            print("Omitimos el mensaje")
        }
        
        completionHandler()
    }
}

