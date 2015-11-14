//
//  AppDelegate.swift
//  bitter
//
//  Created by Matt Condon on 11/13/15.
//  Copyright © 2015 mattc. All rights reserved.
//

import UIKit
import TabBarScrollableViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.

//    item.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)

    window = UIWindow(frame: UIScreen.mainScreen().bounds)

    if let window = window {

      let items = ["ic_home", "ic_pin_drop", "ic_person"].enumerate().map { (pair) -> UITabBarItem in
        let tbi = UITabBarItem(title: nil, image: UIImage(named: pair.element), tag: pair.index)
        tbi.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        return tbi
      }

      window.rootViewController = TabBarScrollableViewController(withViewControllers: [
        FeedViewController(),
        MapViewNavigationController(),
        ProfileViewController()
        ],
        tabBarItems: items,
        andSelectedItem: 0
      )
      window.makeKeyAndVisible()
    }
    

    // configure UIAppearance
    UINavigationBar.appearance().barTintColor = .themeColor()
    UINavigationBar.appearance().tintColor = .highlightColor()
    UINavigationBar.appearance().titleTextAttributes = [
      NSForegroundColorAttributeName: UIColor.highlightColor(),
      // NSFontAttributeName: UIFont.themeTitleFont()
    ]

    UITabBar.appearance().tintColor = .themeColor()

    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

