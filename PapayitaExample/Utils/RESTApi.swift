//
//  RESTApi.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/11/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias ResponseClosure = (JSON) -> Void

class RESTApi {

    private let baseUrl: String = "https://api.themoviedb.org/3/movie"
    public private(set) var posterBaseUrl: String = "https://image.tmdb.org/t/p/w185"
    public private(set) var youtubeBaseUrl: String = "https://www.youtube.com/watch"
    private let apiKey: String

    init() {
        apiKey = Utilities().getApiKey()
    }

    public func getMovies(category: String, page: Int, responseREST: ResponseClosure?) {
        let parameters = [
            "api_key": apiKey,
            "page": String(page)
        ]

        Alamofire.request(baseUrl + "/" + category, parameters: parameters)
            .responseJSON{ response in
                if let json = response.result.value {
                    let respuesta = JSON(json)
                    responseREST!(respuesta)
                }
        }
    }
}
