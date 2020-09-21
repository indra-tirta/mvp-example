//
//  HomeRouter.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

class HomeRouter: HomePresenterToRouter {
    
    static func createModule() -> HomeVC {
        let presenter: HomeViewToPresenter = HomePresenter()
        let router: HomePresenterToRouter = HomeRouter()
        let view = HomeVC()
        
        presenter.view = view
        presenter.router = router
        view.presenter = presenter
        
        return view
    }
    
    func presentAddMovie(viewController: UIViewController?) {
        let addMovieVC = AddMovieRouter.createModule()
        let navigationController = UINavigationController(rootViewController: addMovieVC)
        
        viewController?.present(navigationController, animated: true, completion: nil)
    }
}
