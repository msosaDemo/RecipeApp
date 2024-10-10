//
//  NetworkHandler.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidUrl, invalidResponse, parseError
}

protocol NetworkProtocol {
    func loadFrom<T: Decodable>(url: URL) async throws -> T?
}

class NetworkCaller: NetworkProtocol {
    
    static let shared = NetworkCaller()
    
    func loadFrom<T: Decodable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.parseError
        }
    }
    
}
