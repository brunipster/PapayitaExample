//
//  HomeRoute.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/12/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import Foundation
import UIKit

let homeViewIdentifier = "HomeViewController"

class HomeRoute: HomeRouteDelegate {
    
    var rootView: RootView?
    var homeView: HomeViewController?
    var presenter: HomePresenterDelegate = HomePresenter()
    
    func presentModule(fromView window: AnyObject) {
        let view = homeViewFromStoryboard()
        view.presenter = presenter
        presenter.view = view
        
        homeView = view
        rootView?.showRootViewController(view, inWindow: window as! UIWindow)
    }
    
    func showHomeViewController() {
    }
    
    func homeViewFromStoryboard() -> HomeViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: homeViewIdentifier)
            as! HomeViewController
        return viewController
    }

    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }
}
