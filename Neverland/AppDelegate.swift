//
//  AppDelegate.swift
//  Neverland
//
//  Created by Apple on 1/27/18.
//  Copyright © 2018 League of Sophistication. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        UserDefaults.saveIncomingAvatarSetting(true)
        UserDefaults.saveOutgoingAvatarSetting(true)

    
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeViewController = LandingViewController()
        window!.rootViewController = homeViewController
        window!.makeKeyAndVisible()

        return true
    }
}

//extension JSQMessagesInputToolbar {
//    override open func didMoveToWindow() {
//        super.didMoveToWindow()
//        if #available(iOS 11.0, *) {
//            if self.window?.safeAreaLayoutGuide != nil {
//                self.bottomAnchor.constraintLessThanOrEqualToSystemSpacingBelow((self.window?.safeAreaLayoutGuide.bottomAnchor)!, multiplier: 1.0).activate()
//            }
//        }
//    }
//}
//
