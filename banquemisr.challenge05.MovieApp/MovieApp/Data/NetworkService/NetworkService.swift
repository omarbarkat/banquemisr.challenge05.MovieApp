//
//  NetworkService.swift
//  MovieApp
//
//  Created by eng.omar on 28/09/2024.
//

import Foundation

class NetworkService {
    func request<T: Decodable>(_ endpoint: String, method: HTTPMethod, parameters: [String: Any]?, headers: [String: String]?, completion: @escaping ((Result<T, Error>)) -> Void) {
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }

        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                completion(.failure(error))
                return
            }
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 500, userInfo: nil)))
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Response JSON: \(jsonString)")
            }

            do {
                let decodedObject: T = try Decoderr().decode(data: data)
                completion(.success(decodedObject))
                print(decodedObject)
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
