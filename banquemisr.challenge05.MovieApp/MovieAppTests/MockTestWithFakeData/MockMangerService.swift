//
//  MockMangerService.swift
//  MovieAppTests
//
//  Created by eng.omar on 29/09/2024.
//

import XCTest
@testable import MovieApp

final class MockMangerService: XCTestCase {
    
    override func setUpWithError() throws {
    
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testMovieResponseParsing() {
           let mockNetworkManager = MockNetworkManager(shouldReturnTrue: true)
           
           mockNetworkManager.getData { data in
               guard let data = data else {
                   XCTFail("No data in response")
                   return
               }
               
               do {
                   let decoder = JSONDecoder()
                   let movieResponse = try decoder.decode(MockeModel.self, from: data)
                   XCTAssertEqual(movieResponse.page, 1)
                   XCTAssertEqual(movieResponse.results.first?.title, "The Crow")
               } catch {
                   XCTFail("Failed to decode response: \(error)")
               }
           }
       }
}

struct MockeModel: Codable {
    let page: Int
    let totalPages: Int
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case results
    }
}

struct Movie: Codable {
    let title: String
    let id: Int
}
