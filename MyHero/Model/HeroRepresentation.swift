//
//  HeroRepresentation.swift
//  MyHero
//
//  Created by Aaron Cleveland on 1/30/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import Foundation

struct HeroResults: Codable {
    let results: [HeroRepresentation]
    
    struct HeroRepresentation: Codable {
        let id: String
        let name: String
        let powerstats: SuperPowers
        let biography: Biography
        let appearance: Appearance
        let work: Work
        let connections: Connections
        let image: Image
    }
    
    struct SuperPowers: Codable {
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct Biography: Codable {
        let fullName: String
        let alterEgos: String
        let aliases: [String]
        let placeOfBirth: String
        let firstAppearance: String
        let publisher: String
        let alignment: String
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full-name"
            case alterEgos = "alter-egos"
            case aliases
            case placeOfBirth = "place-of-birth"
            case firstAppearance = "first-appearance"
            case publisher
            case alignment
        }
    }
    
    struct Appearance: Codable {
        let gender: String
        let race: String
        let height: [String]
        let weight: [String]
        let eyeColor: String
        let hairColor: String
        
        enum CodingKeys: String, CodingKey {
            case gender
            case race
            case height
            case weight
            case eyeColor = "eye-color"
            case hairColor = "hair-color"
        }
    }
    
    struct Work: Codable {
        let occupation: String
        let base: String
    }
    
    struct Connections: Codable {
        let groupAffiliation: String
        let relatives: String
        
        enum CodingKeys: String, CodingKey {
            case groupAffiliation = "group-affiliation"
            case relatives
        }
    }
    
    struct Image: Codable {
        let urlString: String
        
        enum CodingKeys: String, CodingKey {
            case urlString = "url"
        }
    }
}
