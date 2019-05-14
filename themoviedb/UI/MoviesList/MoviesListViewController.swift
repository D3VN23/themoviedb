//
//  MoviesListViewController.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/11/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit
import Foundation
import SVProgressHUD

final class MoviesListViewController: BaseViewController<MoviesListPresenter> {
    private let movieListView = MovieListView.loadViewFromXib()
    
    override func loadView() {
        view = movieListView
    }

    override func viewDidLoad() {
        presenter.moviesListViewHandler = MoviesListViewHandler(setViewModels: { [weak self] viewModels in
            self?.movieListView.update(with: viewModels)

        }, showLoading: { show in
            show ? SVProgressHUD.show() : SVProgressHUD.dismiss()
        })

        super.viewDidLoad()
    }
}


