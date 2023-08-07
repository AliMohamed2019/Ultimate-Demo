//
//  NetworkLayer.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import UIKit

// Implement the network layer conforming to the protocol
class NetworkLayer: NetworkLayerProtocol {
    
    func performRequest<T:Decodable>(from url: URL, with body: Data?, method: String, completion: @escaping (Result<T, Error>)->Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode),
                  let data = data
            else {
                let error = NSError(domain: "NetworkError", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            if let resultData = try? JSONDecoder().decode(T.self, from: data) {
                completion(.success(resultData))
            } else {
                let error = NSError(domain: "ParsingError", code: 0, userInfo: nil)
                completion(.failure(error))
            }
            
        }.resume()
    }
    
}
