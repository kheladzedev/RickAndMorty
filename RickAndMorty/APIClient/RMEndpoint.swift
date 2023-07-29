//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by Edward Kheladze on 27.07.2023.
//

import Foundation


// Represents unique API endpoint
@frozen enum RMEndpoint: String {
    
    // Endpoint to get character info
    case character
    case location
    case episode
}
