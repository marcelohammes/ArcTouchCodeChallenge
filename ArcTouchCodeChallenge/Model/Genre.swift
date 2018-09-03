//
//  Genre.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 22/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

public class Genre: Object, Mappable {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    let movies = LinkingObjects(fromType: Movie.self, property: "genres")

    public required convenience init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        id      <- map["id"]
        name    <- map["name"]
    }

    public override static func primaryKey() -> String? {
        return "id"
    }

    class func syncList(onComplete: @escaping () -> Void) {
        APIClient.shared.getGenresList { (genres, _) in
            if let genres = genres, !genres.isEmpty {
                do {
                        let realm = try Realm()

                        try realm.write {
                            realm.add(genres, update: true)
                        }

                        onComplete()

                } catch {
                    print("The genres list cannot be persisted")
                }
            }
        }
    }

    class func getGenre(byID id: Int) -> Genre? {
        if let realm = try? Realm() {
            return realm.object(ofType: Genre.self, forPrimaryKey: id)
        } else {
            return nil
        }
    }
}
