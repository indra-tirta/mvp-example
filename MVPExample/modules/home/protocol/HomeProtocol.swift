//
//  HomeProtocol.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

protocol HomeViewToPresenter: AnyObject {
    var view: HomePresenterToView? {get set}
    func getMovies()
    func deleteMovie(_ movie: Movie)
    
    var router: HomePresenterToRouter? {get set}
    func openAddMovie()
}

protocol HomePresenterToView: AnyObject {
    var presenter: HomeViewToPresenter? {get set}
    func showMovies(_ movies: [Movie])
}

protocol HomePresenterToRouter: AnyObject {
    static func createModule() -> HomeVC
    func presentAddMovie(viewController: UIViewController?)
}
