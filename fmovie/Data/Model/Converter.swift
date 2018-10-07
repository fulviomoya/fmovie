//
//  Converter.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation

extension Movie {
    func asDataModel() -> MovieDataModel {
        let dm = MovieDataModel()
        dm.id = self.uid
        dm.title = self.title
        dm.rating = self.rating
        dm.sinopsis = self.sinopsis
        dm.posterPath = self.posterPath
        dm.publicationDate = self.publicationDate
        
        return dm
    }
}
