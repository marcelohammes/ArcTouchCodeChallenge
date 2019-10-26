//
//  Constants.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 22/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import Foundation

class BaseURL {

    // MARK: PRIVATE
    static private let MOVIES_DB_API_BASE_URL = "https://api.themoviedb.org/3/"

    static let MOVIES_DB_IMAGES_BASE_URL = "https://image.tmdb.org/t/p/"

    static var popularMoviesURL: URL {
        return URL(string: MOVIES_DB_API_BASE_URL+"movie/popular")!
    }

    static var genresListURL: URL {
        return URL(string: MOVIES_DB_API_BASE_URL+"genre/movie/list")!
    }
}
