//
//  HomeInteractor.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/11/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorDelegate {
    
    var restApi = RESTApi()
    
    var presenter: HomePresenterDelegate?

    func getMovies(page: Int, response: @escaping ()->Void) {
        restApi.getMovies(category: "popular", page: page, responseREST: { result in
            let list = result["results"].array
            var listMovies = [Movie]()
                list?.forEach({jsn in
                    listMovies.append(Movie.init(json: jsn))
                })
            self.presenter?.fetchFillTableMovies(movies: listMovies)
            response()
        })
    }
}
