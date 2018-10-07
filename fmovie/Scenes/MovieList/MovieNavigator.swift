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
    func goToDetail(_ movie: MovieDataModel)
}

class MovieNavigator: MovieNavigatorProtocol {
    private let navigationController: UINavigationController
    private let storyBoard: UIStoryboard
    private let serviceLocator: ServiceLocator
    
    init(serviceLocator: ServiceLocator, storyBoard: UIStoryboard, navigationController: UINavigationController) {
        self.serviceLocator = serviceLocator
        self.navigationController = navigationController
        self.storyBoard = storyBoard
    }
    
    func goToDetail(_ movie: MovieDataModel) {
        let controlerIdentifier: String = MovieDetailViewController.self.description()
        
        guard let vc = storyBoard.instantiateViewController(withIdentifier: controlerIdentifier) as? MovieDetailViewController else {
            fatalError(ErrorMessage.INVALID_VIEWCONTROLLER.rawValue)
        }
        
        vc.viewModel = MovieDetailViewModel(repository: serviceLocator.getRepository(), navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
