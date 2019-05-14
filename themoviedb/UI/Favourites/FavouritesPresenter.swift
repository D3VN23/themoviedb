//
//  FavouritesPresenter.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 14.05.19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit
import RealmSwift

struct FavouritesListViewHandler {
    let setViewModels: ([FavouritesViewModel]) -> Void
}

final class FavouritesPresenter: Presenter {
    var favouritesListViewHandler: FavouritesListViewHandler?

    private let storageService: StorageService

    init(storageService: StorageService = ProductionStorageService()) {
        self.storageService = storageService
    }

    func didBindController() {}

    func viewWillAppear() {
        let movies = getFavouritesMovies()
        favouritesListViewHandler?.setViewModels(movies.map { self.getViewModel(from: $0) })
    }
}

extension FavouritesPresenter {
    private func getFavouritesMovies() -> Results<MovieResponse> {
        return storageService.getData(for: MovieResponse.self)
    }

    private func getViewModel(from movie: MovieResponse) -> FavouritesViewModel {
        let favouritesListViewModel = FavouritesViewModel(name: movie.title,
                                                          imageUrl: URL(string: "\(Constants.Network.imagesBaseUrl)\(movie.posterUrl)")!,
                                                          releaseDate: movie.releaseData,
                                                          overview: movie.overview)
        return favouritesListViewModel
    }

    private func showMovie(with id: Int) {
        // moviesListRouter?.showMovie(with: id)
    }
}
