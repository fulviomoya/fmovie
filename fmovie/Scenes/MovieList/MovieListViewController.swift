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
    
    internal var viewModel: MovieListViewModel!
    internal var movieCollection: [MovieItemViewModel] = []
    
    static var sortTappedCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.delegate = self
        navigationController?.delegate = self
        
        movieListCollectionView.delegate = self
        movieListCollectionView.dataSource = self
        movieListCollectionView.removeGaps()
        
        viewModel = MovieListViewModel(viewController: self)
    }
    
    @IBAction func sortButtonTapped(_ sender: Any) {
        viewModel.changeSortCriterial(collection: movieCollection)
        movieListCollectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        super.viewWillAppear(animated)
        movieListCollectionView.reloadData()
    }
    
    internal func updateUI(with movies: [MovieItemViewModel]?) {
        guard let movies = movies else {  return  }
        movieCollection = movies
        movieListCollectionView.reloadData()
    }
}
