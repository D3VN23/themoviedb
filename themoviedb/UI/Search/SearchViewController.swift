//
//  SearchViewController.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 14.05.19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit
import SVProgressHUD

class SearchViewController: BaseViewController<SearchPresenter> {
    private let searchView = SearchView.loadViewFromXib()

    override func loadView() {
        view = searchView
    }

    override func viewDidLoad() {
        presenter.searchViewHandler = SearchViewHandler(setViewModel: { [weak self] viewModel in
            self?.searchView.update(with: viewModel)

        }, showLoading: { show in
            show ? SVProgressHUD.show() : SVProgressHUD.dismiss()
        })

        super.viewDidLoad()
    }
}
