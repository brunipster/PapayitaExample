//
//  HomeViewBuilder.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/11/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import Foundation

protocol HomeViewDelegate: class {
    var presenter: HomePresenterDelegate? {get set}
    
    var page: Int {get set}
    
    func reloadTableViewListMovie(_ moviesList: [Movie])
}

protocol HomeInteractorDelegate {
    
    var presenter: HomePresenterDelegate? {get set}
    
    func getMovies(page: Int, response: @escaping () -> ())
}

protocol HomePresenterDelegate {
    var view: HomeViewDelegate? {get set}
    var interactor: HomeInteractorDelegate? {get set}
    
    func updateView(page: Int, respose: @escaping  () ->())
    
    func fetchFillTableMovies(movies: [Movie])
}

protocol HomeRouteDelegate: class {
    func presentModule(fromView window: AnyObject)
    func showHomeViewController()
}
