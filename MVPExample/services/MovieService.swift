//
//  MovieService.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import Firebase
import FirebaseDatabase

class MovieService {
    static var shared = MovieService()
    let movieRef = Database.database().reference().child("movies")
    
    func getAll(completionHandler: @escaping ([Movie]) -> Void) {
        movieRef.queryOrdered(byChild: "date_added").observe(.value) { (snapshot) in
            var movies = [Movie]()
            
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                if let value = child.value as? NSDictionary {
                    let name = value["name"] as? String
                    let dateAdded = value["date_added"] as? Int ?? 0
                    let movie = Movie(id: child.key, name: name, dateAdded: dateAdded.dateFormat)
                    movies.append(movie)
                }
            }
            
            movies.reverse()

            completionHandler(movies)
        }
    }
    
    func add(movie: Movie) {
        let params: [String: Any] = [
            "name": movie.name ?? "",
            "date_added": movie.dateAdded?.timeStamp ?? 0
        ]
        movieRef.childByAutoId().setValue(params)
    }
    
    func delete(movie: Movie) {
        movieRef.child(movie.id).removeValue()
    }
}
