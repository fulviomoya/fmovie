//
//  Repository.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import RealmSwift

protocol RepositoryProtocol {
    associatedtype T
    func queryAll<T: MovieDataModel>() -> Results<T>
    func save(entity: T)
    func update(object: MovieDataModel, favorite: Bool)
}

final class Repository<T>: RepositoryProtocol where T: MovieDataModel {
    private let configuration: Realm.Configuration
    
    private var realm: Realm {
        return try! Realm(configuration: self.configuration)
    }
    
    init(configuration: Realm.Configuration) {
        self.configuration = configuration
    }
    
    func queryAll<T: MovieDataModel>() -> Results<T> {
        return realm.objects(T.self)
    }
    
    func save(entity: MovieDataModel) -> Void {
       try! realm.write {
            realm.add(entity, update: true)
        }
    }
    
    func update(object: MovieDataModel, favorite: Bool) {
        try! realm.write {
            object.isFavorite = favorite
            realm.add(object, update: true)
        }
    }
    
    func findBy(id: Int) -> MovieDataModel? {
        let r = realm.object(ofType: T.self, forPrimaryKey: id)
        return r
    }
}
