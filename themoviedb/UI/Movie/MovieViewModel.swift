//
//  MovieViewModel.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/13/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation

struct MovieViewModel {
    let name: String
    let posterUrl: URL
    let overview: String
    var isFavourite: Bool
    
    var addToFavouriteTapHandler: (() -> Void)?
}
