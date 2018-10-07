//
//  Repository.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import RxSwift
import RxRealm

protocol RepositoryProtocol {
    associatedtype T
    func queryAll() -> Observable<[T]>
   // func query(with predicate: NSPredicate,
     //          sortDescriptors: [NSSortDescriptor]) -> Observable<[T]>
    func save(entity: T) -> Observable<Void>

}

final class Repository<T>: RepositoryProtocol where T: MovieDataModel {
    private let configuration: Realm.Configuration
    private let scheduler: ThreadScheduler
    
    private var realm: Realm {
        return try! Realm(configuration: self.configuration)
    }
    
    init(configuration: Realm.Configuration) {
        let name = "br.instacarros.fmovie"
        self.configuration = configuration
        self.scheduler = ThreadScheduler(threadName: name)
    }
    
    func queryAll() -> Observable<[MovieDataModel]> {
        return Observable.deferred {
            let realm = self.realm
            let objects = realm.objects(MovieDataModel.self)
            
            return Observable.array(from: objects)
            
        }.subscribeOn(scheduler)
    }
    
    /*func query(with predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> Observable<[MovieDataModel]> {
        return Observable.deferred {
            let realm = self.realm
            let objects = realm.objects(MovieDataModel.self).sorted(by: { (m1, m2) -> Bool in
                m1.
            })
            
            return Observable.array(from: objects)
            
            }.subscribeOn(scheduler)
    }*/
    
    func save(entity: MovieDataModel) -> Observable<Void> {
        return Observable.create { observer in
            do {
                try self.realm.write {
                    self.realm.add(entity, update: true)
                }
                observer.onNext(())
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            return Disposables.create()
        }.subscribeOn(scheduler)
    }
}
