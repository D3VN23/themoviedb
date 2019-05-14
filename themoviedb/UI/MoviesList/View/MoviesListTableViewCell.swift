//
//  MoviesListTableViewCell.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/11/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher

final class MoviesListTableViewCell: UITableViewCell {
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var releaseDateLabel: UILabel!
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var descriptionTextView: UITextView!
    
    private let xExclusionOffset: CGFloat = 10.0
    private let yExclusionOffset: CGFloat = 0.0
    
    func update(with viewModel: GeneralMovieViewModel?) {
        nameLabel.text = viewModel?.name
        releaseDateLabel.text = viewModel?.releaseDate
        descriptionTextView.text = viewModel?.overview
        posterImageView.kf.setImage(with: viewModel?.imageUrl)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setExclusionPath()
    }
    
    override func prepareForReuse() {
        posterImageView.kf.cancelDownloadTask()
    }
}

// MARK: - Private methods
extension MoviesListTableViewCell {
    private func setExclusionPath() {
        let exclusionPathFrame = convert(posterImageView.frame, to: descriptionTextView).offsetBy(dx: xExclusionOffset, dy: yExclusionOffset)
        let exclusionPath = UIBezierPath(roundedRect: exclusionPathFrame, cornerRadius: 0)
        descriptionTextView.textContainer.exclusionPaths = [exclusionPath]
    }
}
