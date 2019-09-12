//
//  AppDelegate.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/6/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import UIKit
import Kingfisher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        return navigationController
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        let homeViewBuilder = AppDependencies.assembleModule()
        self.navigationController.viewControllers = [homeViewBuilder!]
        
        return true
    }

}

