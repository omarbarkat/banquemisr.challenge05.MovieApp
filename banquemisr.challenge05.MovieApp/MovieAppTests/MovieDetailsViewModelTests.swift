//
//  MovieDetailsViewModelTests.swift
//  MovieAppTests
//
//  Created by eng.omar on 29/09/2024.
//

import XCTest
@testable import MovieApp

final class MovieDetailsViewModelTests: XCTestCase {
    var viewModel: MovieDetailsViewModel!
    override func setUpWithError() throws {
    
        viewModel = MovieDetailsViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    func testConvertMinutesToHoursAndMinutes() {
    let result =    viewModel.convertMinutesToHoursAndMinutes(minutes: 60)
        XCTAssertEqual(viewModel.convertMinutesToHoursAndMinutes(minutes: 60).hours, 1)
        XCTAssertEqual(viewModel.convertMinutesToHoursAndMinutes(minutes: 60).minutes, 0)
        
    }
    func testGetMovieDetails() {
        let expectation = XCTestExpectation(description: "expect response from server done successfully")
        viewModel.getMovieDetails(movieID: 957452) {
            XCTAssertEqual(self.viewModel.movieDetails?.id, 957452)
            XCTAssertEqual(self.viewModel.movieDetails?.title, "The Crow")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
    }
    func testGetMovieTrailer() {
        let expectation = XCTestExpectation(description: "expect response from server done successfully")
        viewModel.getMovieTrailer(movieID: 957452) {
            XCTAssertEqual(self.viewModel.videoKey, "4CLE3pWAAr8")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
    }
}
