//
//  AppDelegate.swift
//  ContactsList
//
//  Created by Игорь Огай on 13/03/2019.
//  Copyright © 2019 Игорь Огай. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var app: App?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        app = App()
        window?.rootViewController = app?.rootController()
        window?.makeKeyAndVisible()
        return true
    }
    
}

