//
//  AddMovieVC.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

class AddMovieVC: UIViewController, AddMoviePresenterToView {
    @IBOutlet var textName: UITextField!
    var presenter: AddMovieViewToPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Add Movie"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveMovie))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closePage))
        
        textName.becomeFirstResponder()
    }

    @objc func saveMovie() {
        let name = textName.text
        let movie = Movie(name: name, dateAdded: Date())
        presenter?.addMovie(movie)
    }
    
    @objc func closePage() {
        presenter?.closeAddMovie()
    }
}
