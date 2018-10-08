//
//  MovieListViewModel.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MovieListViewModel {
    private let repository: Repository<MovieDataModel>
    private let viewController: MovieListViewController?
    private let service: ServiceManager
    private static var sortTappedCount = 0
    
    var movies: [MovieItemViewModel]? {
        didSet {
            self.viewController?.updateUI(with: self.movies)
        }
    }
    
    init(viewController: MovieListViewController) {
        self.viewController = viewController
        self.repository = Application.shared.serviceLocator.getRepository()
        self.service = Application.shared.serviceManager
        
        NotificationCenter.default.addObserver(self, selector: #selector(refresh(notification: )),
                                               name: .updateMovies, object: nil)
        fetchMovieList()
    }
    
    @objc func fetchMovieList() {
        if repository.queryAll().count == 0 {
            service.getPopularMovies { list in
                
                for movie in list.sorted(by: {$0.rating > $1.rating }) { // Default rating
                    self.repository.save(entity: movie.asDataModel())
                }
                NotificationCenter.default.post(name: .updateMovies, object: nil)   //Notify any posible observers
            }
        }
        getMovieListFromDB()
    }
    
    @objc func refresh(notification: NSNotification){
        getMovieListFromDB()
    }
    
    fileprivate func getMovieListFromDB() {
        var itemViewModel:[MovieItemViewModel] = []
        repository.queryAll().forEach { item in
            itemViewModel.append(MovieItemViewModel(with: item))
        }
        
        self.movies = itemViewModel
    }
    
    func changeSortCriterial(collection: [MovieItemViewModel]) {
        switch MovieListViewModel.sortTappedCount {
        case 0:
            movies = collection.sorted(by: {$0.publicationDate > $1.publicationDate })
            MovieListViewModel.sortTappedCount += 1
        case 1:
            movies = collection.sorted(by: {$0.title < $1.title })
            MovieListViewModel.sortTappedCount += 1
        case 2:
            movies = collection.sorted(by: {$0.rating < $1.rating })
            MovieListViewModel.sortTappedCount = 0
        default:
            MovieListViewModel.sortTappedCount = 0
        }
        print("soring:: \(MovieListViewModel.sortTappedCount)")
    }
    
    func saveLogAnalytics(movieTitle: String) {
      FirebaseAnalyticsServices.logMovieEvent(title: movieTitle)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
