//
//  MoviesListRouter.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/13/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation

final class MoviesListRouter {
    private weak var moviesListViewController: MoviesListViewController?
    
    init(moviesListViewController: MoviesListViewController) {
        self.moviesListViewController = moviesListViewController
    }
    
    func showMovie(with id: Int) {
        let movieViewController = MovieViewController(presenter: MoviePresenter(movieId: id))
        moviesListViewController?.navigationController?.pushViewController(movieViewController, animated: true)
    }
}
