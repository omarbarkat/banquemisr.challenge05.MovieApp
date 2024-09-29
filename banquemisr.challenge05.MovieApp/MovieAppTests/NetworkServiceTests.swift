//
//  NetworkServiceTests.swift
//  MovieAppTests
//
//  Created by eng.omar on 29/09/2024.
//

import XCTest
@testable import MovieApp
final class NetworkServiceTests: XCTestCase {
    var networkService: NetworkService!
    override func setUpWithError() throws {
        networkService = NetworkService()
    }

    override func tearDownWithError() throws {
        networkService = nil
    }
    func testRequest() {
        let expectation = XCTestExpectation(description: "get response from server success")
        networkService.request(MovieAPI.nowPlaying.url, method: .GET, parameters: nil, headers: nil) { (result:Result<TopRateModel, Error>) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertTrue(response.results[0].id != nil, " movie id is : \(response.results[0].id)")
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
    }

  
}
