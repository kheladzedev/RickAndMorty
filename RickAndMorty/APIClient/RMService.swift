//
//  RMService.swift
//  RickAndMorty
//
//  Created by Edward Kheladze on 27.07.2023.
//

import Foundation

// Primary API serivce object to get Rick and Morty data
final class RMService {
    /// Shared singleton instance`
    static let shared = RMService()
    
    // Privatized constructor
    private init() {}
    
    
    // Send Rick and Morty API Call
    public func execute<T: Codable>(
        _ request: RMRequest,
        expencting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
    }
}
