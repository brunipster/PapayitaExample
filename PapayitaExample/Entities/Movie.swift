//
//  Movie.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/11/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Movie {
    var identifier: Int
    var title: String
    var originalTitle: String
    var posterPath: String
    var overview: String
    var popularity: Double
    var genres: [Int]

    init(json: JSON) {
        self.title = json["title"].stringValue
        self.originalTitle = json["original_title"].stringValue
        self.posterPath = json["poster_path"].stringValue
        self.overview = json["overview"].stringValue
        self.popularity = json["popularity"].doubleValue
        self.identifier = json["id"].intValue
        self.genres = json["genre_ids"].arrayValue.map({(json) -> Int in
            return json.intValue
        })
    }
}
