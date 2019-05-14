//
//  TabBarViewController.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/13/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let moviesListPresenter = MoviesListPresenter()
        let moviesListViewController = MoviesListViewController(presenter: moviesListPresenter)
        let moviesListRouter = MoviesListRouter(moviesListViewController: moviesListViewController)
        moviesListPresenter.moviesListRouter = moviesListRouter
        moviesListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)

        let favouritesListViewController = FavouritesViewController(presenter: FavouritesPresenter())
        favouritesListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        let searchViewController = SearchViewController(presenter: SearchPresenter())
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)

        viewControllers = [moviesListViewController, favouritesListViewController, searchViewController]
    }
}
