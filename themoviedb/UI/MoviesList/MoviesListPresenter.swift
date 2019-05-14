//
//  MoviesListPresenter.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/11/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation

struct MoviesListViewHandler {
    let setViewModels: ([MoviesListViewModel]) -> Void
    let showLoading: (Bool) -> Void
}

final class MoviesListPresenter: Presenter {
    var moviesListRouter: MoviesListRouter?
    var moviesListViewHandler: MoviesListViewHandler?
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = ProductionNetworkService()) {
        self.networkService = networkService
    }
    
    func didBindController() {
        loadData()
    }
}

extension MoviesListPresenter {
    private func loadData() {
        moviesListViewHandler?.showLoading(true)
        networkService.requestDecodable(.nowPlaying) { (result: Result<NowPlayingMoviesResponse, Error>) in
            self.moviesListViewHandler?.showLoading(false)
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.moviesListViewHandler?.setViewModels(response.movies.map { self.getViewModel(from: $0) })

                case .failure(let error):
                    print("Error: \(error.localizedDescription)") // Error handler should be here
                }
            }
        }
    }

    private func getViewModel(from response: NowPlayingMoviesResponse.Movie) -> MoviesListViewModel {
        var moviesListViewModel = MoviesListViewModel(name: response.title,
                                                      imageUrl: URL(string: "\(Constants.Network.imagesBaseUrl)\(response.posterUrl)")!,
                                                      releaseDate: response.releaseData,
                                                      overview: response.overview)
        moviesListViewModel.didSelectMovie = { [weak self] in self?.showMovie(with: response.id) }

        return moviesListViewModel
    }

    private func showMovie(with id: Int) {
        moviesListRouter?.showMovie(with: id)
    }
}
