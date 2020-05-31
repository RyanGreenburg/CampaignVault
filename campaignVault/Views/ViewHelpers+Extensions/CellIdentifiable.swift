//
//  CellIdentifiable.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

protocol CellIdentifiable {
    static var nibID: String { get }
    static var reuseID: String { get }
}

