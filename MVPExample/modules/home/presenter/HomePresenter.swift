//
//  HomePresenter.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

class HomePresenter: HomeViewToPresenter {
    var router: HomePresenterToRouter?
    var view: HomePresenterToView?
    
    func getMovies() {
        MovieService.shared.getAll { (movies) in
            self.view?.showMovies(movies)
        }
    }
    
    func deleteMovie(_ movie: Movie) {
        MovieService.shared.delete(movie: movie)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.getMovies()
        })
    }
    
    func openAddMovie() {
        router?.presentAddMovie(viewController: view as? UIViewController)
    }
}
