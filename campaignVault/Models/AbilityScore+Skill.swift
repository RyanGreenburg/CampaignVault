//
//  AbilityScore+Skill.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct AbilityScore: Codable, SRDRequestable {
    let id: String
    let name: String
    let index: String
    let url: String
    let fullName: String
    let explanation: [String]
//    let skills: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case index
        case url
        case fullName = "full_name"
        case explanation = "desc"
//        case skills
    }
}

struct Skill: Codable, SRDRequestable {
    let id: String
    let name: String
    let index: String
    let url: String
    let desc: [String]
//    let abilityScores: [SRDRequestable]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case index
        case url
        case desc
//        case abilityScores = "ability-scores"
    }
}
