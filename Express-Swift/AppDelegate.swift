//
//  AppDelegate.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/13.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame:CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
        let tabBarController = UITabBarController()
        let searchVC = UINavigationController(rootViewController:SearchViewController())
        let historyVC = UINavigationController(rootViewController:HistoryViewController())
        let expressPhoneVC = UINavigationController(rootViewController:ExpressPhoneViewController())
        
        
        tabBarController.viewControllers = [searchVC,historyVC,expressPhoneVC]
        
        let searchTabBarItem = UITabBarItem(title:"查询快递",image: UIImage(named:"icon_tab_query.png"),selectedImage:UIImage(named: "icon_tab_query_sel.png"))
        let historyTabBarItem = UITabBarItem(title:"查询历史",image: UIImage(named:"icon_tab_history.png"),selectedImage:UIImage(named: "icon_tab_history_sel.png"))

        let expressPhoneTabBarItem = UITabBarItem(title:"快递电话",image: UIImage(named:"icon_tel_tab.png"),selectedImage:UIImage(named: "icon_tel_tab_sel.png"))
        
        searchVC.tabBarItem = searchTabBarItem
        historyVC.tabBarItem = historyTabBarItem
        expressPhoneVC.tabBarItem = expressPhoneTabBarItem
        
        searchVC.tabBarController?.tabBar.tintColor = APP_RED
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
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

