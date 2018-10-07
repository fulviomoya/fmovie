//
//  MovieNavigator.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import UIKit

protocol MovieNavigatorProtocol {
    func displayList()
    func goToDetail(_ movie: MovieDataModel)
}

class MovieNavigator: MovieNavigatorProtocol {
    private let navigationController: UINavigationController
    private let storyBoard: UIStoryboard
    private let serviceLocator: ServiceLocator
    private let serviceManager: ServiceManager
    
    init(serviceManager: ServiceManager, serviceLocator: ServiceLocator,
         storyBoard: UIStoryboard, navigationController: UINavigationController) {
        
        self.serviceManager = serviceManager
        self.serviceLocator = serviceLocator
        self.navigationController = navigationController
        self.storyBoard = storyBoard
    }
    
    func displayList() {
        let controllerIdentifier: String = MovieListViewController.self.description()
        
        guard let vc = storyBoard.instantiateViewController(withIdentifier: controllerIdentifier) as? MovieListViewController else {
            fatalError(ErrorMessage.INVALID_VIEWCONTROLLER.rawValue)
        }
        
        vc.viewModel = MovieListViewModel(service: serviceManager, repository: serviceLocator.getRepository(), navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToDetail(_ movie: MovieDataModel) {
        let controllerIdentifier: String = MovieDetailViewController.self.description()
        let navigator = MovieDetailNavigator(serviceLocator: serviceLocator, storyBoard: storyBoard, navigationController: navigationController)
       
        guard let vc = storyBoard.instantiateViewController(withIdentifier: controllerIdentifier) as? MovieDetailViewController else {
            fatalError(ErrorMessage.INVALID_VIEWCONTROLLER.rawValue)
        }
        
        vc.viewModel = MovieDetailViewModel(movie: movie, navigator: navigator)
        navigationController.pushViewController(vc, animated: true)
    }
}
