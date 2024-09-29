//
//  HomeViewModelTests.swift
//  MovieAppTests
//
//  Created by eng.omar on 29/09/2024.
//

import XCTest
@testable import MovieApp
final class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    override func setUpWithError() throws {
        viewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    func testFetchMovies() {
        let expectation = expectation(description: "response from server success")
        viewModel.fetchMovies(for: MovieAPI.nowPlaying.url) { response in
            XCTAssertNotNil(response)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
    }
  
}
