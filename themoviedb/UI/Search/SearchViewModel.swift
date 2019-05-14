//
//  SearchViewModel.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 14.05.19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation

struct SearchViewModel {
    let movies: [SearchMovieViewModel]
    let didSearchButtonClick: ((_ query: String) -> Void)
}

struct SearchMovieViewModel: GeneralMovieViewModel {
    let name: String
    let imageUrl: URL
    let releaseDate: String
    let overview: String

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
