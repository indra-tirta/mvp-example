//
//  AddMovieProtocol.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

protocol AddMoviePresenterDelegate: AnyObject {
    var view: AddMovieViewDelegate? {get set}
    func addMovie(_ movie: Movie)
    
    var router: AddMovieRouterDelegate? {get set}
    func closeAddMovie()
}

protocol AddMovieViewDelegate: AnyObject {
    var presenter: AddMoviePresenterDelegate? {get set}
}

protocol AddMovieRouterDelegate: AnyObject {
    static func createModule() -> AddMovieVC
    func dismissAddMovie(view: UIViewController?)
}
