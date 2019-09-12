//
//  Pelicula.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/10/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import Foundation

enum Pelicula {
    struct Estreno {
        var title: String
        var rating: Double
        var image: Data
    }
    
    struct Popular{
        var title: String
        var rating: Double
        var image: Data
        var overview: String
        var genres: [Int]
    }
    
    struct Detalle {
        var title: String
        var rating: Double
        var image: Data
        var overview: String
        var genres: String
    }
}
