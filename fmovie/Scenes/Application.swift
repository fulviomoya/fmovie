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
    private let serviceManager: ServiceManager
    
    private init() {
        self.serviceManager = ServiceManager()
        self.serviceLocator = ServiceLocator()
        
    }
    
    func baseInitialConfiguration(in window: UIWindow) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = UINavigationController()
        let navigator = MovieNavigator(serviceManager: serviceManager, serviceLocator: serviceLocator, storyBoard: storyBoard, navigationController: navigationController)
        window.rootViewController = storyBoard.instantiateInitialViewController()
        
        navigator.displayList()
    }
}
