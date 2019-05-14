//
//  MovieView.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/13/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit
import Kingfisher

final class MovieView: UIView, XibLoadable {
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var overviewTextView: UITextView!
    @IBOutlet private var favouriteButton: UIButton!
    
    @IBAction private func didTapFavouriteButton() { addToFavouriteTapHandler?() }
    
    private var addToFavouriteTapHandler: (() -> Void)?
    
    func update(with viewModel: MovieViewModel?) {
        nameLabel.text = viewModel?.name
        overviewTextView.text = viewModel?.overview
        posterImageView.kf.setImage(with: viewModel?.posterUrl)
        
        (viewModel?.isFavourite ?? false) ? favouriteButton.setTitle("🖤", for: .normal) :
                                            favouriteButton.setTitle("❤️", for: .normal)
        
        addToFavouriteTapHandler = viewModel?.addToFavouriteTapHandler
    }
}
