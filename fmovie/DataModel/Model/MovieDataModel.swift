//
//  MovieDataModel.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

final class MovieDataModel: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var rating: Float = 0.0
    @objc dynamic var sinopsis: String = ""
    @objc dynamic var posterPath: String = ""
    @objc dynamic var publicationDate: String = ""
    @objc dynamic var isFavorite: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
