//
//  PlayerCharacter.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/10/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

protocol Combatant {
    var name: String { get set }
    var initiativeBonus: Int { get }
    var combatInfo: CombatInfo { get set }
}

extension Combatant {
    var passivePerception: Int { 10 }
}

struct PlayerCharacter: Hashable, Combatant {
    var name: String
    var initiativeBonus: Int
    var combatInfo: CombatInfo
}

struct CombatInfo: Hashable {
    var hitPoints: HitPoints
    var armorClass: Int = 0
    var speed: Int = 0
    
}

struct HitPoints: Hashable {
    var maxHitPoints: Int = 0
    var currentHitPoints: Int = 0
    var temporaryHitPoints: Int = 0
}
