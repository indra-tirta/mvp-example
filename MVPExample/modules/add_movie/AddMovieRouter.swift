//
//  AddMovieRouter.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

class AddMovieRouter: AddMovieRouterDelegate {
    static func createModule() -> AddMovieVC {
        let router: AddMovieRouterDelegate = AddMovieRouter()
        let presenter: AddMoviePresenterDelegate = AddMoviePresenter()
        let view = AddMovieVC()
        
        presenter.router = router
        presenter.view = view
        view.presenter = presenter
        
        return view
    }
    
    func dismissAddMovie(view: UIViewController?) {
        view?.dismiss(animated: true, completion: nil)
    }
}
