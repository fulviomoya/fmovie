//
//  Application.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation

final class Application {
    static let shared = Application()
    
    let serviceLocator: ServiceLocator
    let serviceManager: ServiceManager
    
    private init() {
        self.serviceManager = ServiceManager()
        self.serviceLocator = ServiceLocator()
    }
}
