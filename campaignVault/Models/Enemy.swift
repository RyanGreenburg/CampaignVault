//
//  Enemy.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/11/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct Enemy: Combatant {
    var name: String
    var initiativeBonus: Int
    var combatInfo = CombatInfo(hitPoints: HitPoints())
}
