//
//  Coordinators.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/11/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

class Coordinators {
    internal class CKCoordinator: CKServicing {}
    
    static var initiativeTracker = InitiativeTracker()
    static var ckCoordinator = CKCoordinator()
    static var srdCoordinator = SRDCoordinator()
    static var mocks = MockCombatants()
}
