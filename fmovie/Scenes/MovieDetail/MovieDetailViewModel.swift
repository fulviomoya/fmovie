//
//  MovieDetailViewModel.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation

class MovieDetailViewModel {
    private let repository: Repository<MovieDataModel>
   
    init() {
        self.repository =  Application.shared.serviceLocator.getRepository()
    }
    
    func movieChangePreference(modelId: Int, isFavorite: Bool) {
        if let dataModel: MovieDataModel = repository.findBy(id: modelId)  {
            repository.update(object: dataModel, favorite: isFavorite)
        }
        NotificationCenter.default.post(name: .updateMovies, object: nil)
    } 
}
