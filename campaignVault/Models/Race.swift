//
//  Race.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct Race: Codable, SRDRequestable {
    struct AbilityBonus: Codable {
        let name: String
        let bonus: Int
        let url: String
    }
    
    struct ChoiceOptions: Codable {
        let quantity: String
        let type: String
        let options: [SRDResource]
        
        enum CodingKeys: String, CodingKey {
            case quantity = "choose"
            case type
            case options = "from"
        }
    }
    
    let id: String
    let name: String
    let index: String
    let url: String
    let speed: Int
    let abilityBonuses: [AbilityBonus]
    let alignment: String
    let age: String
    let size: String
    let sizeDescription: String
    let startingProficiencies: [SRDResource]
    let proficiencyOptions: [ChoiceOptions]
    let languages: [SRDResource]
    let languageDescription: String
    let traits: [SRDResource]
    let subraces: [SRDResource]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case index
        case url
        case speed
        case abilityBonuses = "ability_bonuses"
        case alignment
        case age
        case size
        case sizeDescription = "size_description"
        case startingProficiencies = "starting_proficiencies"
        case proficiencyOptions = "starting_proficiency_options"
        case languages
        case languageDescription = "language_desc"
        case traits
        case subraces
    }
}

struct Subrace: Codable, SRDRequestable {
    let id: String
    let name: String
    let index: String
    let url: String
    let race: SRDResource
    let desc: String
    let abilityBonus: Race.AbilityBonus
    let startingProficiencies: SRDResource
    let languages: [String]
    let racialTraits: [SRDResource]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case index
        case url
        case race
        case desc
        case abilityBonus = "ability_bonus"
        case startingProficiencies = "starting_proficiencies"
        case languages
        case racialTraits = "racial_traits"
    }
}
