//
//  File.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/12/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import Foundation
import UIKit

class RootView: NSObject{
    func showRootViewController(_ viewController: UIViewController, inWindow: UIWindow) {
        let navigationController = navigationControllerFromWindow(inWindow)
        navigationController?.viewControllers = [viewController]
    }
    
    func navigationControllerFromWindow(_ window: UIWindow) -> UINavigationController? {
        let navigationController = window.rootViewController as? UINavigationController
        return navigationController
    }
}
