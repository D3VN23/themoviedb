//
//  SearchResponse.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 14.05.19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
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

extension SearchResponse.Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterUrl = "poster_path"
        case overview
        case releaseData = "release_date"
    }
}
