//
//  AddMovieProtocol.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

protocol AddMovieViewToPresenter: AnyObject {
    var view: AddMoviePresenterToView? {get set}
    func addMovie(_ movie: Movie)
    
    var router: AddMoviePresenterToRouter? {get set}
    func closeAddMovie()
}

protocol AddMoviePresenterToView: AnyObject {
    var presenter: AddMovieViewToPresenter? {get set}
}

protocol AddMoviePresenterToRouter: AnyObject {
    static func createModule() -> AddMovieVC
    func dismissAddMovie(view: UIViewController?)
}
