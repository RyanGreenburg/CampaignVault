//
//  InitiativeDataSource.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/11/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

enum Section: CaseIterable {
    case main
}

class InitiativeDataSource: UICollectionViewDiffableDataSource<Section, InitiativePosition> {
    
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView) { (collectionView, indexPath, initiativePosition) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InitiativePositionCollectionViewCell.reuseID, for: indexPath) as? InitiativePositionCollectionViewCell else { return UICollectionViewCell() }
            
            let model = InitiativePositionCellModel(position: initiativePosition)
            cell.configureWith(model)
            
            return cell
        }
    }
    
    func applySnapshot(with combatants: [Combatant]) {
        Coordinators.initiativeTracker.rollInitiative(with: combatants)
        var snapshot = NSDiffableDataSourceSnapshot<Section, InitiativePosition>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(Coordinators.initiativeTracker.positions)
        apply(snapshot, animatingDifferences: true)
    }
}
