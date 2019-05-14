//
//  NetworkService.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/11/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation

public typealias DecodableCompletion<D: Decodable> = (_ result: Result<D, Error>) -> Void

protocol NetworkService {
    func requestDecodable<D: Decodable>(_ target: MovieTarget, completion: @escaping DecodableCompletion<D>)
}
