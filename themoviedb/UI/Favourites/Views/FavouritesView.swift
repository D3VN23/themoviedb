//
//  FavouritesView.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 14.05.19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit

final class FavouritesView: UIView, XibLoadable {
    @IBOutlet private var tableView: UITableView!

    private var viewModels: [FavouritesViewModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: String(describing: MoviesListTableViewCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: MoviesListTableViewCell.self))
        tableView.tableFooterView = UIView()
    }

    func update(with viewModels: [FavouritesViewModel]) {
        self.viewModels = viewModels
        tableView.reloadData()
    }
}

extension FavouritesView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MoviesListTableViewCell.self), for: indexPath) as! MoviesListTableViewCell
        cell.update(with: viewModels[indexPath.row])
        return cell
    }
}

