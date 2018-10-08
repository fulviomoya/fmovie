//
//  MovieCollectionViewCell.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteIndicatorImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func bind(_ viewModel: MovieItemViewModel) {
        self.favoriteIndicatorImageView.isHidden = !viewModel.favoriteIndicator
        self.posterImageView.af_setImage(withURL: URL(string: Constants.IMAGE_ENPOINT + viewModel.posterImageURL)!)
        self.titleLabel.text = viewModel.title
        self.ratingLabel.text = "Rating:  " + String(viewModel.rating)
    }
}
