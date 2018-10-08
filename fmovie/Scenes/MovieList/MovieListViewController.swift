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

    private var viewModel: MovieListViewModel!
    private var movieCollection: [MovieItemViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewConfiguration()
        
        viewModel = MovieListViewModel(viewController: self)
        movieListCollectionView.dataSource = self
        movieListCollectionView.delegate = self
    }
    
    func updateUI(with movies: [MovieItemViewModel]?) {
        guard let movies = movies else {  return  }

        movieCollection = movies
        movieListCollectionView.reloadData()
    }
    
    //Privates functions
    private func collectionViewConfiguration() {
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

extension MovieListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.MOVIE_REUSABLE, for: indexPath) as! MovieCollectionViewCell
        cell.bind(movieCollection[indexPath.row])
        
        return cell
    }
}

extension MovieListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: Identifiers.LIST_TO_DETAIL_SEGUE, sender: movieCollection[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? MovieDetailViewController {
            nextViewController.model = sender as? MovieItemViewModel
        }
    }
}
