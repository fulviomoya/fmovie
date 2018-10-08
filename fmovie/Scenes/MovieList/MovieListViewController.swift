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
    internal var favoriteMovieCollection: [MovieItemViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieListCollectionView.delegate = self
        movieListCollectionView.dataSource = self
        
        collectionViewConfiguration()
    
        viewModel = MovieListViewModel(viewController: self)
        
        tabBarController?.delegate = self
        navigationController?.delegate = self
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
    
    //Privates functions
    fileprivate func collectionViewConfiguration() {
        let flow = movieListCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        //Removing gab betweem collection view elements.
        let itemSpacing: CGFloat = 1
        let itemsInOneLine: CGFloat = 2
        
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let width = UIScreen.main.bounds.size.width - itemSpacing * CGFloat(itemsInOneLine - 1)
        flow.itemSize = CGSize(width: floor(width/itemsInOneLine), height: width*1.5/itemsInOneLine)
        flow.minimumInteritemSpacing = 1
        flow.minimumLineSpacing = 1
    }
}
