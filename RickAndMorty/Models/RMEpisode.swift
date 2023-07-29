//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Edward Kheladze on 27.07.2023.
//

import Foundation

struct RMEpisode: Codable {
    
    let  id: Int
    let  name: String
    let  type: String
    let  dimension: String
    let  residents: [String]
    let  url: String
    let created: String
}
