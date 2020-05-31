//
//  CreationFlowViewModel.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/29/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

class CreationFlowViewModel {
    var classes: [SRDResource] = []
    var subclasses: [SRDResource] = []
    var races: [SRDResource] = []
    var subraces: [SRDResource] = []
    var abilityScores: [SRDResource] = []
    var skills: [SRDResource] = []
    
    init() {
        Coordinators.srdCoordinator.fetchCreationFlowItems()
        Coordinators.srdCoordinator.fetchInProgressGroup.notify(queue: .main) { [weak self] in
            guard let classes = Coordinators.srdCoordinator.classes?.resources,
                let subclasses = Coordinators.srdCoordinator.subclasses?.resources,
                let races = Coordinators.srdCoordinator.races?.resources,
                let subraces = Coordinators.srdCoordinator.subraces?.resources,
                let abilityScores = Coordinators.srdCoordinator.abilityScores?.resources,
                let skills = Coordinators.srdCoordinator.skills?.resources
                else { return }
            
            self?.classes = classes
            self?.subclasses = subclasses
            self?.races = races
            self?.subraces = subraces
            self?.abilityScores = abilityScores
            self?.skills = skills
        }
    }
}
