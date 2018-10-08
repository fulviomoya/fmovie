//
//  MovieListViewController+UITabBarController.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/8/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UICollectionViewDataSource
extension MovieListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (movieCollection.count == 0) {
            collectionView.setEmptyMessage(ErrorMessage.EMPTY_COLLECTION.rawValue)
        } else {
            collectionView.restore()
        }

        return movieCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.MOVIE_REUSABLE, for: indexPath) as! MovieCollectionViewCell
        cell.bind(movieCollection[indexPath.row])
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension MovieListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.saveLogAnalytics(movieTitle: movieCollection[indexPath.row].title)
        performSegue(withIdentifier: Identifiers.LIST_TO_DETAIL_SEGUE, sender: movieCollection[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? MovieDetailViewController {
            nextViewController.model = sender as? MovieItemViewModel
        }
    }
}

//MARK: - UITabBarControllerDelegate, UINavigationControllerDelegate
extension MovieListViewController: UITabBarControllerDelegate, UINavigationControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        findSelectedTagForTabBarController(tabBarController: tabBarController)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        findSelectedTagForTabBarController(tabBarController: navigationController.tabBarController)
    }
    
    private func findSelectedTagForTabBarController(tabBarController: UITabBarController?) {
        if let viewControllers = tabBarController?.viewControllers {
            NotificationCenter.default.post(name: .updateMovies, object: nil)
            let selectedController = viewControllers[tabBarController!.selectedIndex]
            
            if selectedController.tabBarItem.tag == 1 { //Favorite tag
                navigationItem.title = "Favorites"
                updateUI(with: movieCollection.filter {$0.favoriteIndicator})
            } else {
                navigationItem.title = "fMovie List"
            }
        }
    }
}
