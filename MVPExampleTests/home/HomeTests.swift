//
//  HomeTests.swift
//  MVPExampleTests
//
//  Created by Indra Tirta Nugraha on 21/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import XCTest
@testable import MVPExample

class HomeTests: XCTestCase {
    
    class MockHomeView: HomeVC {
        var showMoviesCalled: Bool = false
        var isMovieDeleted: Bool = false
        
        override func showMovies(_ movies: [Movie]) {
            showMoviesCalled = true
        }
        
        override func didDeleteMovie(_ status: Bool) {
            isMovieDeleted = status
        }
    }
    
    class MockHomeRouter: HomeRouter {
        var addMoviePresented: Bool = false
        
        override func presentAddMovie(viewController: UIViewController?) {
            super.presentAddMovie(viewController: viewController)
            addMoviePresented = true
        }
    }
    
    var presenter: HomePresenter?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let view = MockHomeView()
        let router = MockHomeRouter()
        presenter = HomePresenter()
        
        presenter?.view = view
        presenter?.router = router
        view.presenter = presenter
        
        view.loadView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreateModule() {
        XCTAssertNotNil(HomeRouter.createModule())
    }
    
    func testGetMovies() {
        let expectation = XCTestExpectation(description: "Get Movies")
        
        presenter?.getMovies()
        
        if let view = presenter?.view as? MockHomeView {
            XCTAssertTrue(view.showMoviesCalled)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testDeleteMovie() {
        let movie = Movie(id: "0", name: "Marvel", dateAdded: Date())
        let expectation = XCTestExpectation(description: "Delete Movie")
        
        presenter?.deleteMovie(movie)
        
        if let view = presenter?.view as? MockHomeView {
            XCTAssertTrue(view.isMovieDeleted)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testOpenAddMoviePage() {
        let expectation = XCTestExpectation(description: "Open Add Movie Page")
        
        presenter?.openAddMovie()
        
        if let router = presenter?.router as? MockHomeRouter {
            XCTAssertTrue(router.addMoviePresented)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
