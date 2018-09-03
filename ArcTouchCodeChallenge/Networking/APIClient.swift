//
//  APIClient.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 22/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

struct MapperContext: MapContext {
    var fromAPI = false
}

public class APIClient {
    public static let shared = APIClient()

    // MARK: Genre List
    public func getGenresList(_ onComplete: @escaping ([Genre]?, Error?) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        let parameters = ["api_key": MOVIES_DB_API_KEY]

        Alamofire.request(BaseURL.genresListURL, parameters: parameters)
            .validate()
            .responseArray(keyPath: "genres",
                           context: MapperContext(fromAPI: true)) { (response: DataResponse<[Genre]>) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        onComplete(value, nil)
                    } else {
                        onComplete(nil, nil)
                    }
                case .failure(let error):
                    onComplete(nil, error)
                }
        }
    }

    // MARK: Movies
    public func getMoviesList(page: Int, _ onComplete: @escaping ([Movie], Error?) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        let parameters: Parameters = ["api_key": MOVIES_DB_API_KEY, "page": page]

        Alamofire.request(BaseURL.popularMoviesURL, parameters: parameters)
            .validate()
            .responseArray(keyPath: "results",
                           context: MapperContext(fromAPI: true)) { (response: DataResponse<[Movie]>) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        onComplete(value, nil)
                    } else {
                        onComplete([Movie](), nil)
                    }
                case .failure(let error):
                    onComplete([Movie](), error)
                }
        }
        .responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value as? [AnyHashable: Any],
                    let total_pages = value["total_pages"] as? Int {
                    POPULAR_MOVIES_LIST_TOTAL_PAGES = total_pages
                }
            case .failure: break

            }
        }
    }
}
