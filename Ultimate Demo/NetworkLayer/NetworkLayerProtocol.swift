//
//  NetworkLayerProtocol.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import Foundation

protocol NetworkLayerProtocol {
    func performRequest<T:Decodable>(from url: URL, with body: Data?, method: String, completion: @escaping (Result<T, Error>) -> Void)
}
