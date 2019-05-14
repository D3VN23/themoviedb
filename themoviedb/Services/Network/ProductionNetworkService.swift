//
//  ProductionNetworkService.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/13/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation
import Moya

struct ProductionNetworkService: NetworkService {
    let provider = MoyaProvider<MovieTarget>()
    
    init() {}
    
    func requestDecodable<D>(_ target: MovieTarget, completion: @escaping (Result<D, Error>) -> Void) where D : Decodable {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let model = try response.map(D.self)
                    completion(.success(model))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
