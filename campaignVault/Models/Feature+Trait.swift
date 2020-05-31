//
//  Feature+Trait.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct Feature: Codable, SRDRequestable {
    let id: String
    let name: String
    let index: String
    let url: String
    let level: Int?
    let `class`: [SRDResource]
    let desc: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case index
        case url
        case level
        case `class` = "class"
        case desc
    }
}

struct Trait: Codable, SRDRequestable {
    let id: String
    let name: String
    let index: String
    let url: String
    let races: [SRDResource]
    let subraces: [SRDResource]
    let desc: [String]
}
