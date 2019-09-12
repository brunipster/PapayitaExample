//
//  Movie.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/11/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Movie{
    var id: Int
    var title: String
    var original_title: String
    var poster_path: String
    var overview: String
    var popularity: Double
    var genre_ids: [Int]
    
    init(json: JSON) {
        self.title = json["title"].stringValue
        self.original_title = json["original_title"].stringValue
        self.poster_path = json["poster_path"].stringValue
        self.overview = json["overview"].stringValue
        self.popularity = json["popularity"].doubleValue
        self.id = json["id"].intValue
        self.genre_ids = json["genre_ids"].arrayValue.map({(json) -> Int in
            return json.intValue
        })
    }
}
