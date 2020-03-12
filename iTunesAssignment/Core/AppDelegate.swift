//
//  AppDelegate.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        enableIQKeyboardManager()
        initalizeWindow()
        start()
        return true
    }
    
    private func enableIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
    }
    
    private func initalizeWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }
    
    private func start() {
        let navigationController = UINavigationController(rootViewController: SearchConfigurator.viewcontroller())
        window?.rootViewController = navigationController
    }
}
