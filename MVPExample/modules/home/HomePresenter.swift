//
//  HomePresenter.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

class HomePresenter: HomePresenterDelegate {
    var router: HomeRouterDelegate?
    var view: HomeViewDelegate?
    
    func getMovies() {
        MovieService.shared.getAll { (movies) in
            self.view?.showMovies(movies)
        }
    }
    
    func deleteMovie(_ movie: Movie) {
        MovieService.shared.delete(movie: movie) { (status) in
            self.view?.didDeleteMovie(status)
        }
    }
    
    func openAddMovie() {
        router?.presentAddMovie(viewController: view as? UIViewController)
    }
}
