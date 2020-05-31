//
//  SRDCoordinator.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/30/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation

class SRDCoordinator {
    private let srdService = SRDService()
    
    var classes: SRDResources?
    var subclasses: SRDResources?
    var races: SRDResources?
    var subraces: SRDResources?
    var abilityScores: SRDResources?
    var skills: SRDResources?
    var proficiencies: SRDResources?
    var languages: SRDResources?
    
    var isFetching = false 
    var fetchInProgressGroup = DispatchGroup()
    
    func fetchCreationFlowItems() {
        fetchClasses()
        fetchSubclasses()
        fetchRaces()
        fetchSubraces()
        fetchAbilityScores()
        fetchSkills()
        fetchLanguages()
        fetchProficiencies()
    }
    
    func fetchClasses() {
        guard classes == nil else { return }
        isFetching = true
        fetchInProgressGroup.enter()
        srdService.fetchRequest(.classes) { result in
            switch result {
            case .success(let data):
                self.classes = data.decode(type: SRDResources.self)
            case .failure(let error):
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
            }
            self.fetchInProgressGroup.leave()
        }
    }
    
    func fetchSubclasses() {
        guard subclasses == nil else { return }
        isFetching = true
        fetchInProgressGroup.enter()
        srdService.fetchRequest(.subclasses) { result in
            switch result {
            case .success(let data):
                self.subclasses = data.decode(type: SRDResources.self)
            case .failure(let error):
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
            }
            self.fetchInProgressGroup.leave()
        }
    }
    
    func fetchRaces() {
        guard races == nil else { return }
        isFetching = true
        fetchInProgressGroup.enter()
        srdService.fetchRequest(.races) { result in
            switch result {
            case .success(let data):
                self.races = data.decode(type: SRDResources.self)
            case .failure(let error):
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
            }
            self.fetchInProgressGroup.leave()
        }
    }
    
    func fetchSubraces() {
        guard subraces == nil else { return }
        isFetching = true
        fetchInProgressGroup.enter()
        srdService.fetchRequest(.subraces) { result in
            switch result {
            case .success(let data):
                self.subraces = data.decode(type: SRDResources.self)
            case .failure(let error):
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
            }
            self.fetchInProgressGroup.leave()
        }
    }
    
    func fetchAbilityScores(){
        guard abilityScores == nil else { return }
        isFetching = true
        fetchInProgressGroup.enter()
        srdService.fetchRequest(.abilityScores) { result in
            switch result {
            case .success(let data):
                self.abilityScores = data.decode(type: SRDResources.self)
            case .failure(let error):
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
            }
            self.fetchInProgressGroup.leave()
        }
    }
    
    func fetchSkills() {
        guard skills == nil else { return }
        isFetching = true
        fetchInProgressGroup.enter()
        srdService.fetchRequest(.skills) { result in
            switch result {
            case .success(let data):
                self.skills = data.decode(type: SRDResources.self)
            case .failure(let error):
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
            }
            self.fetchInProgressGroup.leave()
        }
    }
    
    func fetchProficiencies() {
        guard proficiencies == nil else { return }
        isFetching = true
        fetchInProgressGroup.enter()
        srdService.fetchRequest(.proficiencies) { result in
            switch result {
            case .success(let data):
                self.proficiencies = data.decode(type: SRDResources.self)
            case .failure(let error):
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
            }
            self.fetchInProgressGroup.leave()
        }
    }
    
    func fetchLanguages() {
        guard languages == nil else { return }
        isFetching = true
        fetchInProgressGroup.enter()
        srdService.fetchRequest(.languages) { result in
            switch result {
            case .success(let data):
                self.languages = data.decode(type: SRDResources.self)
            case .failure(let error):
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
            }
            self.fetchInProgressGroup.leave()
        }
    }
}
