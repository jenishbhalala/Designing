//
//  AppDelegate.swift
//  Designing
//
//  Created by Jenish on 11/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import GoogleSignIn
import TwitterKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
        }
    }
    

    

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions:launchOptions)
        GIDSignIn.sharedInstance().clientID = "671021176712-5037el269c2jhap59qhgibpqr0bulvvr.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
      TWTRTwitter.sharedInstance().start(withConsumerKey: "EGSGJP2CJvdWUpAhRyO2gKTXE", consumerSecret: "sEvhmUZsZ3aHh81eqYuu8SlJmKstJlqugYjhbN4Ii7BiAlDGER")
//        TWTRTwitter.sharedInstance().start(withConsumerKey: "F7eRLtiucynR1FKQxixFXSRiI", consumerSecret: "JdxBIewp3BFEbXoOEfeIjm1ATyENV36rjPnOm1KVWzns5XKP9i")

        // Override point for customization after application launch.
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let appId: String = SDKSettings.appId
        if url.scheme != nil && url.scheme!.hasPrefix("fb\(appId)") && url.host ==  "authorize" {
            return SDKApplicationDelegate.shared.application(app, open: url, options: options)
        }else if GIDSignIn.sharedInstance().handle(url as URL?,
                                                     sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                                     annotation: options[UIApplication.OpenURLOptionsKey.annotation]){
                
                return true
                
        }else {
            var valueTwitter: Bool = true
          valueTwitter =   TWTRTwitter.sharedInstance().application(app, open: url, options: options)
            return valueTwitter
            
        }
    }
    func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        if (extensionPointIdentifier == UIApplication.ExtensionPointIdentifier.keyboard) {
            return false
        }
        return true
    }
    
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        var handle: Bool = true
        
        
        let options: [String: AnyObject] = [UIApplication.OpenURLOptionsKey.sourceApplication.rawValue: sourceApplication as AnyObject, UIApplication.OpenURLOptionsKey.annotation.rawValue: annotation as AnyObject]
        
        handle = TWTRTwitter.sharedInstance().application(application, open: url, options: options)
        
        
        
        return handle
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
        AppEventsLogger.activate(application)
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

