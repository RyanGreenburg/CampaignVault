//
//  SRDCoordinator.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

protocol SRDRequestable {
    var name: String { get }
    var index: String { get }
    var url: String { get }
}

extension SRDRequestable {
    var uri: String {
        url.replacingOccurrences(of: "/api/", with: "")
    }
}

enum SRDEndpoint: String, CaseIterable {
    // Character Info
    case skills
    case abilityScores = "ability-scores"
    case proficiencies
    case languages
    // Class Info
    case classes
    case subclasses
    case features
    case spellcasting
    case startingEquipment = "starting-equipment"
    // Race Info
    case races
    case subraces
    case traits
    // Equipment
    case equipmentCategories = "equipment-categories"
    case armor
    case weapons
    case adventuringGear = "adventuring-gear"
    case weaponProperties = "weapon-properties"
    // Spells
    case spells
    // Game Mechanics
    case conditions
    case damageTypes = "damage-types"
    case magicSchools = "magic-schools"
    
    static let baseURL = "https://www.dnd5eapi.co/api/"
    
    var path: String {
        return self.rawValue
    }
    
    var url: URL? {
        guard var url = URL(string: SRDEndpoint.baseURL) else { return nil }
        url.appendPathComponent(path)
        return url
    }
}

struct SRDService: NetworkServicing {
    typealias Handler = (Result<Data, NetworkError>) -> Void
    
    func fetchRequest(_ endpoint: SRDEndpoint, object: SRDRequestable? = nil, layer: SRDEndpoint? = nil, completion: @escaping Handler) {
        guard var url = endpoint.url else {
            completion(.failure(.badURL))
            return
        }
        
        if let object = object {
            object.index.isEmpty ? url.appendPathComponent(object.uri) : url.appendPathComponent(object.index)
        }
        
        if let layer = layer {
            url.appendPathComponent(layer.path)
        }
        
        let request = URLRequest(url: url)
        perform(request, completion: completion)
    }
}
