//
//  AddMovieTests.swift
//  MVPExampleTests
//
//  Created by Indra Tirta Nugraha on 22/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import XCTest
@testable import MVPExample

class AddMovieTests: XCTestCase {
    
    class MockAddMovieView: AddMovieVC {
        var isMovieAdded: Bool = false
        
        override func didAddMovie(_ status: Bool) {
            isMovieAdded = true
        }
    }
    
    class MockAddMovieRouter: AddMovieRouter {
        var addMovieDismissed: Bool = false
        
        override func dismissAddMovie(view: UIViewController?) {
            super.dismissAddMovie(view: view)
            addMovieDismissed = true
        }
    }
    
    var presenter: AddMoviePresenter?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let view = MockAddMovieView()
        let router = MockAddMovieRouter()
        presenter = AddMoviePresenter()
        
        presenter?.view = view
        presenter?.router = router
        view.presenter = presenter
        
        view.loadView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateModule() {
        XCTAssertNotNil(AddMovieRouter.createModule())
    }
    
    func testAddMovie() {
        let movie = Movie(id: "0", name: "Marvel", dateAdded: Date())
        let expectation = XCTestExpectation(description: "Add Movie")
        
        presenter?.addMovie(movie)
        
        if let view = presenter?.view as? MockAddMovieView {
            XCTAssertTrue(view.isMovieAdded)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testDismissAddMoviePage() {
        let expectation = XCTestExpectation(description: "Dismiss Add Movie Page")
        
        presenter?.closeAddMovie()
        
        if let router = presenter?.router as? MockAddMovieRouter {
            XCTAssertTrue(router.addMovieDismissed)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
