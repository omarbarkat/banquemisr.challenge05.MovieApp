//
//  DataParser.swift
//  MovieApp
//
//  Created by eng.omar on 28/09/2024.
//

import Foundation

class Decoderr {
    func decode<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
