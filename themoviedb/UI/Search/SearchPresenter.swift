//
//  SearchPresenter.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 14.05.19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit

struct SearchViewHandler {
    let setViewModel: (SearchViewModel) -> Void
    let showLoading: (Bool) -> Void
}

final class SearchPresenter: Presenter {
    var searchViewHandler: SearchViewHandler?

    private let networkService: NetworkService

    init(networkService: NetworkService = ProductionNetworkService()) {
        self.networkService = networkService
    }

    func didBindController() {
        searchViewHandler?.setViewModel(SearchViewModel(movies: [],
                                                        didSearchButtonClick: { [weak self] query in self?.loadData(with: query) }))
    }
}

extension SearchPresenter {
    private func loadData(with query: String) {
        searchViewHandler?.showLoading(true)
        networkService.requestDecodable(.search(query: query)) { (result: Result<SearchResponse, Error>) in
            self.searchViewHandler?.showLoading(false)
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    let searchViewModel = SearchViewModel(movies: response.movies.map { self.getViewModel(from: $0) },
                                                          didSearchButtonClick: { [weak self] query in
                                                              self?.loadData(with: query)
                                                          })
                    self.searchViewHandler?.setViewModel(searchViewModel)

                case .failure(let error):
                    print("Error: \(error.localizedDescription)") // Error handler should be here
                }
            }
        }
    }

    private func getViewModel(from response: SearchResponse.Movie) -> SearchMovieViewModel {
        let searchViewModel = SearchMovieViewModel(name: response.title,
                                                   imageUrl: URL(string: "http://image.tmdb.org/t/p/w300\(response.posterUrl)")!,
                                                   releaseDate: response.releaseData,
                                                   overview: response.overview)
        return searchViewModel
    }

    private func showMovie(with id: Int) {
        // moviesListRouter?.showMovie(with: id)
    }
}
