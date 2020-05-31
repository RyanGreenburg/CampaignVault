//
//  InitiativeCoordinator.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/11/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct InitiativePosition {
    let combatant: Combatant
    let position: Int
}

extension InitiativePosition: Hashable {
    static func == (lhs: InitiativePosition, rhs: InitiativePosition) -> Bool {
        return lhs.combatant.name == rhs.combatant.name && lhs.position == rhs.position
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(combatant.name)
        hasher.combine(combatant.initiativeBonus)
        hasher.combine(position)
    }
}

struct InitiativeTracker {
    var positions = [InitiativePosition]()
    
    mutating func rollInitiative(with combatants: [Combatant]) {
        positions.removeAll()
        var tempArray = [(combatant: Combatant, roll: Int)]()
        for combatant in combatants {
            var roll = DiceCoordinator.roll(.d20)
            roll += combatant.initiativeBonus
            tempArray.append((combatant, roll))
        }
        
        let sortedArray = tempArray.sorted(by: { $0.roll > $1.roll })
        positions = sortedArray.map({ InitiativePosition(combatant: $0.combatant, position: $0.roll) })
    }
}
