//
//  MoviesListViewModel.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/11/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation

protocol GeneralMovieViewModel {
    var name: String { get }
    var imageUrl: URL { get }
    var releaseDate: String { get }
    var overview: String { get }
}

struct MoviesListViewModel: GeneralMovieViewModel {
    let name: String
    let imageUrl: URL
    let releaseDate: String
    let overview: String
    
    var didSelectMovie: (() -> Void)?
    
    init(name: String,
         imageUrl: URL,
         releaseDate: String,
         overview: String) {
        self.name = name
        self.imageUrl = imageUrl
        self.releaseDate = releaseDate
        self.overview = overview
    }
}
