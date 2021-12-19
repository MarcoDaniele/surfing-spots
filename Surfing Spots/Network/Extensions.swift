//
//  Extensions.swift
//  Surfing Spots
//
//  Created by Marco Daniele on 19/12/21.
//

import Foundation

extension URLSession {
    
    func request<T>(_ request: URLRequest) async throws -> T where T: Decodable {

        let (data, _) = try await data(for: request)
                
        return try JSONDecoder().decode(T.self, from: data)
    }
}
