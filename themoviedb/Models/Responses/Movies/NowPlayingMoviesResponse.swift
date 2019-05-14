//
//  Movie.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/11/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation

struct NowPlayingMoviesResponse: Decodable {
    var movies: [Movie] { return results }
    
    private let results: [Movie]
    
    struct Movie {
        let id: Int
        let title: String
        let posterUrl: URL
        let overview: String
        let releaseData: String
    }
}

extension NowPlayingMoviesResponse.Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterUrl = "poster_path"
        case overview
        case releaseData = "release_date"
    }
}
