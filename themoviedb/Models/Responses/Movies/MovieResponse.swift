//
//  Movie.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/11/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation
import RealmSwift

final class MovieResponse: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var posterUrl = ""
    @objc dynamic var overview = ""
    @objc dynamic var releaseData = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension MovieResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterUrl = "poster_path"
        case overview
        case releaseData = "release_date"
    }
}
