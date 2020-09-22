//
//  AddMoviePresenter.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

class AddMoviePresenter: AddMoviePresenterDelegate {
    var view: AddMovieViewDelegate?
    
    func addMovie(_ movie: Movie) {
        MovieService.shared.add(movie: movie) { (status) in
            self.view?.didAddMovie(status)
        }
    }
    
    var router: AddMovieRouterDelegate?
    
    func closeAddMovie() {
        router?.dismissAddMovie(view: view as? UIViewController)
    }
}
