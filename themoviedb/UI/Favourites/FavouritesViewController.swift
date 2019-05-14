//
//  FavouritesViewController.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 14.05.19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit

class FavouritesViewController: BaseViewController<FavouritesPresenter> {
    private let favouritesView = FavouritesView.loadViewFromXib()

    override func loadView() {
        view = favouritesView
    }

    override func viewWillAppear(_ animated: Bool) {
        presenter.favouritesListViewHandler = FavouritesListViewHandler(setViewModels: { [weak self] viewModels in
            self?.favouritesView.update(with: viewModels)
        })

        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
