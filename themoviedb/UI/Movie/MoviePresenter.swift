//
//  MoviePresenter.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/13/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit

struct MovieViewHandler {
    let setViewModel: (MovieViewModel?) -> Void
    let showLoading: (Bool) -> Void
}

final class MoviePresenter: Presenter {
    var movieViewHandler: MovieViewHandler?
    
    private let movieId: Int
    
    private let storageService: StorageService
    private let networkService: NetworkService

    private var movieViewModel: MovieViewModel?
    
    init(movieId: Int,
         storageService: StorageService = ProductionStorageService.shared,
         networkService: NetworkService = ProductionNetworkService()) {
        self.movieId = movieId
        self.storageService = storageService
        self.networkService = networkService
    }

    func didBindController() {
        movieViewHandler?.showLoading(true)
        networkService.requestDecodable(.details(id: movieId)) { (result: Result<MovieResponse, Error>) in
            DispatchQueue.main.async {
                self.movieViewHandler?.showLoading(false)
                switch result {
                case .success(let response):
                    self.movieViewModel = MovieViewModel(name: response.title,
                                                         posterUrl: URL(string: "\(Constants.Network.imagesBaseUrl)\(response.posterUrl)")!,
                                                         overview: response.overview,
                                                         isFavourite: self.isFavourite(response),
                                                         addToFavouriteTapHandler: { [weak self] in
                                                            self?.addToFavourite(response)
                                                         })
                    self.movieViewHandler?.setViewModel(self.movieViewModel)
                    
                case .failure(let error):
                    print("Error: \(error.localizedDescription)") // Error handler should be here
                }
            }
        }
    }
}

extension MoviePresenter {
    private func isFavourite(_ movie: MovieResponse) -> Bool {
        return storageService.objectExists(id: movie.id, type: MovieResponse.self)
    }

    private func addToFavourite(_ movie: MovieResponse) {
        isFavourite(movie) ? storageService.removeObject(id: movie.id, type: MovieResponse.self) :
                             storageService.addData(object: movie)

        movieViewModel?.isFavourite = isFavourite(movie)
        movieViewHandler?.setViewModel(movieViewModel)
    }
}
