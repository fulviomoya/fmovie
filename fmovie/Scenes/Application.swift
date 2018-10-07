//
//  Application.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import UIKit

final class Application {
    static let shared = Application()
    
    private let serviceLocator: ServiceLocator
    private let network: ServiceManager
    
    private init() {
        self.network = ServiceManager()
        self.serviceLocator = ServiceLocator()
    }
    
    func baseInitialConfiguration(in window: UIWindow) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = UINavigationController()
        let navigator = MovieNavigator(serviceLocator: serviceLocator, storyBoard: storyBoard, navigationController: navigationController)
        window.rootViewController = MovieListViewController()
        
        navigator.displayList()
    }
}
