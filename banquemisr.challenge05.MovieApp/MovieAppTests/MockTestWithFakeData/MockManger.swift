//
//  MockManger.swift
//  MovieAppTests
//
//  Created by eng.omar on 29/09/2024.
//

import Foundation
@testable import MovieApp

class MockNetworkManager {
    var shouldReturnTrue: Bool
    init(shouldReturnTrue: Bool) {
        self.shouldReturnTrue = shouldReturnTrue
    }

    let fakeResponse = """
    {
        "dates": {
            "maximum": "2024-10-02",
            "minimum": "2024-08-21"
        },
        "page": 1,
        "total_pages": 10,
        "results": [
            {
            "title": "The Crow",
                       "id": 1
            }
        ]
    }
    """.data(using: .utf8)!
    
    func getData(completionHandler: @escaping (Data?) -> Void) {
        if shouldReturnTrue {
            completionHandler(fakeResponse)
        } else {
            completionHandler(nil)
        }
    }
}

