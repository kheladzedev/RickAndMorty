//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Edward Kheladze on 29.07.2023.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {

    struct Info: Codable {
        let count: Int
        let pages: String?
        let next: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
