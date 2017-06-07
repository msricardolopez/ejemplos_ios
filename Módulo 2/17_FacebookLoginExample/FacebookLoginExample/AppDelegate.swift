//
//  AppDelegate.swift
//  FacebookLoginExample
//
//  Created by Ricardo López on 12/05/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit
//import FBSDKCoreKit
import FacebookCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showAppMainScreen), name: NSNotification.Name(rawValue: "SHOW_APP_MAIN_SCREEN"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showAppLogin), name: NSNotification.Name(rawValue: "SHOW_APP_LOGIN_SCREEN"), object: nil)
        
        SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        if let _ = AccessToken.current {
            showAppMainScreen()
        }
        
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

//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        print("Source app")
//        let handled = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
//        return handled
//    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print("With options")
        //let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
        let handled = SDKApplicationDelegate.shared.application(app, open: url, options: options)
        return handled
    }
    
}

// MARK: - Change application rootViewController

extension AppDelegate {
    
    func showAppMainScreen() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "SecondViewController")
        window?.rootViewController = mainViewController
    }
    
    func showAppLogin() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController")
        window?.rootViewController = loginViewController
    }
}


