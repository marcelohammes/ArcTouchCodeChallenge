//
//  Movie.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 23/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import IGListKit

public class Movie: Object, Mappable {
    @objc dynamic var id = 0
    @objc dynamic var posterPath = ""
    @objc dynamic var adult = false
    @objc dynamic var overview = ""
    @objc dynamic var releaseDate = ""
    let genres = List<Genre>()
    @objc dynamic var originalTitle = ""
    @objc dynamic var originalLanguage = ""
    @objc dynamic var title = ""
    @objc dynamic var backdropPath = ""
    @objc dynamic var popularity = 0.0
    @objc dynamic var voteCount = 0
    @objc dynamic var video = false
    @objc dynamic var voteAverage = 0.0
    @objc dynamic var hasFavorited = false

    var genreIDs = [Int]()

    var releaseYear: String {
        return releaseDate.components(separatedBy: "-")[0]
    }

    var posterURL: URL! {
        return URL(string: BaseURL.MOVIES_DB_IMAGES_BASE_URL + "w185" + posterPath)
    }

    var backdropURL: URL! {
        return URL(string: BaseURL.MOVIES_DB_IMAGES_BASE_URL + "w780" + backdropPath)
    }

    public required convenience init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        id                  <- map["id"]

        if let localMovie = Movie.getLocalMovie(byID: id) {
            hasFavorited = localMovie.hasFavorited
        }

        genreIDs <- map["genre_ids"]

        posterPath          <- map["poster_path"]
        adult               <- map["adult"]
        overview            <- map["overview"]
        releaseDate         <- map["release_date"]
        originalTitle       <- map["original_title"]
        originalLanguage    <- map["original_language"]
        title               <- map["title"]
        backdropPath        <- map["backdrop_path"]
        popularity          <- map["popularity"]
        voteCount           <- map["vote_count"]
        video               <- map["video"]
        voteAverage         <- map["vote_average"]
    }

    override public static func primaryKey() -> String? {
        return "id"
    }

    override public static func ignoredProperties() -> [String] {
        return ["genreIDs"]
    }

    static func getMovies(page: Int, _ onComplete: @escaping ([Movie], Error?) -> Void) {
        APIClient.shared.getMoviesList(page: page) { (movies, error) in
            onComplete(movies, error)

            if !movies.isEmpty {
                do {
                    let realm = try Realm()

                    try realm.write {
                        realm.add(movies, update: true)

                        for movie in movies {
                            for genreID in movie.genreIDs {
                                if let genre = Genre.getGenre(byID: genreID) {
                                    movie.genres.append(genre)
                                }
                            }
                        }
                    }
                } catch {
                    print("The movies list cannot be persisted")
                }
            }
        }
    }

    class func getLocalMovie(byID id: Int) -> Movie? {
        if let realm = try? Realm() {
            return realm.object(ofType: Movie.self, forPrimaryKey: id)
        } else {
            return nil
        }
    }

    class func getFavoritesMovies() -> [Movie] {
        if let realm = try? Realm() {
            return Array(realm.objects(Movie.self).filter("hasFavorited = true"))
        } else {
            return []
        }
    }

    class func getFilteredMovies(byTerm term: String) -> [Movie] {
        if let realm = try? Realm() {
            let predicate = NSPredicate(format: "title contains[c] %@", term)
            return Array(realm.objects(Movie.self).filter(predicate))
        } else {
            return []
        }
    }

    func toogleFavorite() -> Bool {
        do {
            let realm = try Realm()

            try realm.write {
                self.hasFavorited = !self.hasFavorited
            }
        } catch {
            return false
        }

        return true
    }
}

extension Movie: ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? Movie else { return false }
        return object.id == id &&
                object.hasFavorited == hasFavorited &&
                object.posterPath == posterPath &&
                object.title == title
    }
}
