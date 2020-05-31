//
//  DiceCoordinator.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/10/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct DiceCoordinator {
    enum Dice: Int {
        case d2 = 2
        case d4 = 4
        case d6 = 6
        case d8 = 8
        case d10 = 10
        case d12 = 12
        case d20 = 20
        case d100 = 100
    }
    
    static func roll(_ dice: Dice) -> Int {
        let range = 1...dice.rawValue
        return range.randomElement() ?? 0
    }
}
