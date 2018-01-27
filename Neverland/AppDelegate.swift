//
//  AppDelegate.swift
//  Neverland
//
//  Created by Apple on 1/27/18.
//  Copyright © 2018 League of Sophistication. All rights reserved.
//

import UIKit
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeViewController = LandingViewController()
        window!.rootViewController = homeViewController
        window!.makeKeyAndVisible()

        return true
    }
}
