//
//  AppDelegate.swift
//  GoodsOwner
//
//  Created by Nabanita on 13/01/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.sharedManager().enable = true
        GOStorage.sharedStorage.startCoreDataStack()
        return true
    }
}

