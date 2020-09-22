//
//  HomeProtocol.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

protocol HomePresenterDelegate: AnyObject {
    var view: HomeViewDelegate? {get set}
    func getMovies()
    func deleteMovie(_ movie: Movie)
    
    var router: HomeRouterDelegate? {get set}
    func openAddMovie()
}

protocol HomeViewDelegate: AnyObject {
    var presenter: HomePresenterDelegate? {get set}
    func showMovies(_ movies: [Movie])
    func didDeleteMovie(_ status: Bool)
}

protocol HomeRouterDelegate: AnyObject {
    func presentAddMovie(viewController: UIViewController?)
}
