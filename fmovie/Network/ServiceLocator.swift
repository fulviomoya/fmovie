//
//  ServiceLocator.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import RealmSwift

public final class ServiceLocator {
    private let configuration: Realm.Configuration
    
    public init(configuration: Realm.Configuration = Realm.Configuration()) {
        self.configuration = configuration
    }
    
    func getRepository() -> Repository<MovieDataModel> {
        return Repository<MovieDataModel>(configuration: configuration)
    }
}
