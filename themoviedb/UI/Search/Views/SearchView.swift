//
//  SearchView.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 14.05.19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit

final class SearchView: UIView, XibLoadable {
    @IBOutlet private var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!

    private var viewModel: SearchViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: String(describing: MoviesListTableViewCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: MoviesListTableViewCell.self))
        tableView.tableFooterView = UIView()
    }

    func update(with viewModel: SearchViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension SearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movies.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MoviesListTableViewCell.self), for: indexPath) as! MoviesListTableViewCell
        cell.update(with: viewModel?.movies[indexPath.row])
        return cell
    }
}

extension SearchView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            viewModel?.didSearchButtonClick(query)
        }
    }
}

