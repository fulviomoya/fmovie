//
//  Constants.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import Firebase

enum Constants {
    static let API_ENDPOINT = "https://api.themoviedb.org/3"
    static let IMAGE_ENPOINT = "http://image.tmdb.org/t/p/w400"
    static let APIKey: String = RemoteConfig.remoteConfig().configValue(forKey: "tmdb_api_key").stringValue ?? "unknown"
}

enum Identifiers {
    static let MOVIE_REUSABLE = "movie_reusable"
    static let LIST_TO_DETAIL_SEGUE = "listToDetailSegue"
}

enum ScreenTitle {
    static let LIST = "Movie List"
    static let FAVORITE = "Favorites"
}

enum InformationMessages: String {
    case NOT_FOUND = "Could not be resolve the URL EndPoint"
    case INVALID_VIEWCONTROLLER = "Can not get a ViewController of type."
    case EMPTY_COLLECTION = "No elements to show"
    case SUCCESS_FETCH_PREFERENCE = "Retrieved values from the cloud!"
}

enum FavoriteButtonState: String {
    case IS_FAVORITE = "Add to Favorite"
    case NOT_FAVORITE = "Remove from Favorite"
}

extension Notification.Name {
    static let updateMovies = Notification.Name("update_movies")
}
