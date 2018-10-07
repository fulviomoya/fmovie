//
//  MovieDetailNavigator.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDetailNavigatorProtocol {
    func goBack()
}

final class MovieDetailNavigator: MovieDetailNavigatorProtocol {
    
    private let navigationController: UINavigationController
    private let storyBoard: UIStoryboard
    private let serviceLocator: ServiceLocator
    
    init(serviceLocator: ServiceLocator, storyBoard: UIStoryboard, navigationController: UINavigationController) {
        self.serviceLocator = serviceLocator
        self.navigationController = navigationController
        self.storyBoard = storyBoard
    }
    
    func goBack() {
        //
    }
}
