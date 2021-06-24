//
//  Film.swift
//  l4-practise-tableView
//
//  Created by Harriette Berndes on 22/06/2021.
//

import Foundation

enum FilmRating {
    case great, good, average
    
}

struct Film {
    var title: String
    var releaseDate: Int
    var rating: FilmRating
    var isFavourite: Bool = false
}
