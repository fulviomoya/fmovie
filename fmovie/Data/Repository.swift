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
    // func query(with predicate: NSPredicate,
    //          sortDescriptors: [NSSortDescriptor]) -> Observable<[T]>
    func save(entity: T)
    
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
    
    /*func query(with predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> Observable<[MovieDataModel]> {
     return Observable.deferred {
     let realm = self.realm
     let objects = realm.objects(MovieDataModel.self).sorted(by: { (m1, m2) -> Bool in
     m1.<T: MovieDataModel>
     })
     
     return Observable.array(from: objects)
     
     }.subscribeOn(scheduler)
     }*/
    
}
