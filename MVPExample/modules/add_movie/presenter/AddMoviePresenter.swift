//
//  AddMoviePresenter.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

class AddMoviePresenter: AddMovieViewToPresenter {
    var view: AddMoviePresenterToView?
    
    func addMovie(_ movie: Movie) {
        MovieService.shared.add(movie: movie)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.closeAddMovie()
        })
    }
    
    var router: AddMoviePresenterToRouter?
    
    func closeAddMovie() {
        router?.dismissAddMovie(view: view as? UIViewController)
    }
}
