//
//  CharacterClass.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct Class: Codable, SRDRequestable {
    let id: String
    let index: String
    let name: String
    let url: String
    let hitDice: Int
    let proficiencyChoices: [String]
    let proficiencies: [SRDResource]
    let savingThrows: [SRDResource]
    let startingEquipment: SRDResource
    let subclasses: [SRDResource]
    let spellcasting: SRDResource
    
    enum CodingKeys: String, CodingKey {
        case id
        case index
        case name
        case url
        case hitDice = "hit_die"
        case proficiencyChoices = "proficiency_choices"
        case proficiencies
        case savingThrows = "saving_throws"
        case startingEquipment = "starting_equipment"
        case subclasses
        case spellcasting
    }
}

struct Subclass: Codable, SRDRequestable {
    let id: String
    let name: String
    let index: String
    let url: String
    let `class`: SRDResource
    let subclassFlavor: String
    let desc: [String]
    let features: [SRDResource]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case index
        case url
        case `class` = "class"
        case subclassFlavor = "subclass_flavor"
        case desc
        case features
    }
}
