//
//  AppDelegate.swift
//  SingBa
//
//  Created by dongwei on 16/3/31.
//  Copyright © 2016年 com.myConpany.cn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let frame: CGRect = UIScreen.mainScreen().bounds

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        window = UIWindow(frame:frame)
        window?.backgroundColor = (UIColor.blackColor())
        window?.makeKeyAndVisible()
        window?.rootViewController = CustumerTabBarViewController()
        
        return true
    }

   


}

