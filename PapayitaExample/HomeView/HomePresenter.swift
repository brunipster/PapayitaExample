//
//  HomePresenter.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/11/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterDelegate{
    
    weak var view: HomeViewDelegate?
    
    var interactor: HomeInteractorDelegate?
    
    var route: HomeRouteDelegate?
    
    func updateView(page: Int, respose: @escaping () -> Void) {
        interactor?.getMovies(page: page, response: respose)
    }
    
    func fetchFillTableMovies(movies: [Movie]) {
        view?.reloadTableViewListMovie(movies)
    }
    
}
