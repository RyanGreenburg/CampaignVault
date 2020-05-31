//
//  SRDResource.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct SRDResources: Decodable, Hashable {
    var resources: [SRDResource]
    
    enum CodingKeys: String, CodingKey {
        case resources = "results"
    }
}

struct SRDResource: Codable, SRDRequestable, Hashable {
    let name: String
    var index: String = ""
    let url: String
}
