//
//  ViewController.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    @IBOutlet weak var movieListCollectionView: UICollectionView!

    var viewModel: MovieListViewModel!
    
    required convenience init(viewModel: MovieListViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .map( {_ in })
        
        viewModel.fetchMovieList().do(){}
        
      /*  viewModel = MovieListViewModel(repository: <#T##Repository<MovieDataModel>#>, navigator: <#T##MovieNavigator#>)
        provider.getPopularMovies(completion: { movies in
            for movie in movies {
                print("movies:: \(movie.title)")
            }
        })*/
        //viewModel = MovieListViewModel()
    }
}
