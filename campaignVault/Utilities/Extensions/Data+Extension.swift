//
//  Data+Extension.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

extension Data {
    func decode<T: Decodable>(type: T.Type, decoder: JSONDecoder = JSONDecoder()) -> T? {
        return try? decoder.decode(T.self, from: self)
    }
}
