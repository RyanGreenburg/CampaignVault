//
//  Proficiency+Language.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct Proficiency: Codable, SRDRequestable {
    let id: String
    let name: String
    let type: String
    let index: String
    let url: String
    let desc: [String]
    let classes: [SRDResource]
    let races: [SRDResource]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case type
        case index
        case url
        case desc
        case classes
        case races
    }
}

struct Language: Codable, SRDRequestable {
    let id: String
    let name: String
    let index: String
    let url: String
    let type: String
    let typicalSpeakers: [String]
    let script: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case index
        case url
        case type
        case typicalSpeakers = "typical_speakers"
        case script
    }
}
