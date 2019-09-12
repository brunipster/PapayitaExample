//
//  AppDependencies.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/11/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    
    static func assembleModule() -> UIViewController? {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController

        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRoute()

        view?.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.route = router
        router.homeView = view
        return view
    }
}
