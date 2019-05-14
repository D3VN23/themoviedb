//
//  MovieViewController.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/13/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit
import SVProgressHUD

final class MovieViewController: BaseViewController<MoviePresenter> {
    private let movieView = MovieView.loadViewFromXib()
    
    override func loadView() {
        view = movieView
    }

    override func viewDidLoad() {
        presenter.movieViewHandler = MovieViewHandler(setViewModel: { [weak self] viewModel in
            self?.movieView.update(with: viewModel)
    
        }, showLoading: { show in
            show ? SVProgressHUD.show() : SVProgressHUD.dismiss()
        })
        
        super.viewDidLoad()
    }
}
