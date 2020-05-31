//
//  InitiativeCellModel.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/11/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct InitiativePositionCellModel {
    let position: InitiativePosition
    
    var nameText: String {
        position.combatant.name
    }
    
    var positionText: String {
        "\(position.position)"
    }
}
