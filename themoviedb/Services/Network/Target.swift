//
//  Target.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/13/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation
import Moya

struct Constants {
    struct Network {
        static let imagesBaseUrl = "http://image.tmdb.org/t/p/w300"
    }
}

enum MovieTarget {
    case nowPlaying
    case details(id: Int)
    case search(query: String)
}

extension MovieTarget: TargetType {
    var imagesURL: String { return "" }
    var baseURL: URL { return URL(string: "https://api.themoviedb.org/3")! }
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "/movie/now_playing"
        case .details(let id):
            return "/movie/\(id)"
        case .search:
            return "/search/movie"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .nowPlaying, .details, .search:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .nowPlaying, .details:
            return .requestParameters(parameters: ["api_key": "c264e98a0d18e5320c5fc7496255becd"], encoding: URLEncoding.queryString)
        case .search(let query):
            return .requestParameters(parameters: ["api_key": "c264e98a0d18e5320c5fc7496255becd",
                                                   "query": query],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data {
        switch self {
        case .nowPlaying, .details, .search:
            return Data("{}".utf8)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
