//
//  CreationFlowDataSource.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/28/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

enum CFSection: Int, CaseIterable {
    case baseInfo = 0
    case abilityScore
    case background
    case proficiency
}

class CFDataSource: NSObject, UICollectionViewDataSource {
    weak var collectionView: UICollectionView?
    var model: CreationFlowViewModel
    private var cellModels: [CreationFlowCollectionViewCellModel] = []
    
    init(collectionView: UICollectionView, model: CreationFlowViewModel) {
        self.collectionView = collectionView
        self.model = model
        super.init()
        self.cellModels = self.constructCellModels()
    }
    
    lazy var diffableDataSource: UICollectionViewDiffableDataSource<CFSection, CreationFlowCellModel>? = {
        guard let collectionView = collectionView else { return nil }
        let diffableDS = UICollectionViewDiffableDataSource<CFSection, CreationFlowCellModel>(collectionView: collectionView) { [weak self] (collectionView, indexPath, _) -> UICollectionViewCell? in
            guard let self = self else { return nil }
            
            return self.collectionView(collectionView, cellForItemAt: indexPath)
        }
        return diffableDS
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = CFSection(rawValue: indexPath.row)
        switch section {
        case .baseInfo:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CFBaseInfoCollectionViewCell.reuseID, for: indexPath) as? CFBaseInfoCollectionViewCell,
                let cellModel = cellModels[indexPath.row] as? BaseInfoCellModel
                else { return UICollectionViewCell() }
            
            cell.configure(with: cellModel)
            return cell
            
        case .abilityScore:
             guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CFAbilityScoreCollectionViewCell.reuseID, for: indexPath) as? CFAbilityScoreCollectionViewCell,
                let cellModel = cellModels[indexPath.row] as? AbilityScoreCellModel
                else { return UICollectionViewCell() }
             
            cell.configure(with: cellModel)
            return cell
            
        case .background:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CFBackgroundCollectionViewCell.reuseID, for: indexPath) as? CFBackgroundCollectionViewCell,
                let cellModel = cellModels[indexPath.row] as? BackgroundCellModel
                else { return UICollectionViewCell() }
            
            cell.configure(with: cellModel)
            return cell
            
        case.proficiency:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CFProficiencyCollectionViewCell.reuseID, for: indexPath) as? CFProficiencyCollectionViewCell,
                let cellModel = cellModels[indexPath.row] as? ProficencyCellModel
                else { return UICollectionViewCell() }
            
            cell.configure(with: cellModel)
            return cell
            
        case .none:
            return UICollectionViewCell()
        }
    }
    
    private func constructCellModels() -> [CreationFlowCollectionViewCellModel] {
        let baseInfoCell = BaseInfoCellModel(sourceModel: model, collectionView: collectionView)
        let abilityScoreCell = AbilityScoreCellModel(sourceModel: model, collectionView: collectionView)
        let backgroundCell = BackgroundCellModel(sourceModel: model, collectionView: collectionView)
        let proficiencyCell = ProficencyCellModel(sourceModel: model, collectionView: collectionView)
        return [baseInfoCell, abilityScoreCell, backgroundCell, proficiencyCell]
    }
}
