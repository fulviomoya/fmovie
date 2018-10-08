//
//  FirebaseAnalyticsServices.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/8/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import Firebase

final class FirebaseAnalyticsServices {
    static func logMovieEvent (title: String){
        Analytics.logEvent("movie_detail_show", parameters: ["movie_clicked" : title])
        
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemID: "id-\(title)",
            AnalyticsParameterItemName: title,
            AnalyticsParameterContentType: "cont"
            ])
    }
}
