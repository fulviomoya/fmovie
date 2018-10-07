//
//  ViewController.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    var viewModel: MovieListViewModel!
    let provider = ServiceManager()
    
    @IBOutlet weak var movieListCollectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MovieListViewModel(repository: <#T##Repository<MovieDataModel>#>, navigator: <#T##MovieNavigator#>)
        provider.getPopularMovies(completion: { movies in
            for movie in movies {
                print("movies:: \(movie.title)")
            }
        })
        //viewModel = MovieListViewModel()
    }
}
