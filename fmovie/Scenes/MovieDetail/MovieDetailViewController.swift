//
//  MovieDetailViewController.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var viewModel: MovieDetailViewModel! 
    
    required convenience init(viewModel: MovieDetailViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
