//
//  MovieDetailViewController.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var movieCoverImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sinopsisTextView: UITextView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var viewModel: MovieDetailViewModel!
    var model: MovieItemViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = model.title
        viewModel = MovieDetailViewModel()
        bind(model)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        let title = model.favoriteIndicator == true ?
            FavoriteButtonState.IS_FAVORITE: FavoriteButtonState.NOT_FAVORITE
        
        favoriteButton.setTitle(title.rawValue, for: .normal)
        
        model.favoriteIndicator = !model.favoriteIndicator
        viewModel.movieChangePreference(modelId: model.id, isFavorite: model.favoriteIndicator ) 
    }
    
    private func bind(_ model: MovieItemViewModel) {
        self.movieCoverImageView.af_setImage(withURL: URL(string: Constants.IMAGE_ENPOINT.rawValue + model.posterImageURL)!)
        self.titleLabel.text = model.title
        self.ratingLabel.text = model.rating
        self.sinopsisTextView.text = model.sipnosis
        
        let title = model.favoriteIndicator == false ?
            FavoriteButtonState.IS_FAVORITE: FavoriteButtonState.NOT_FAVORITE
        self.favoriteButton.setTitle(title.rawValue, for: .normal)
    }
}
