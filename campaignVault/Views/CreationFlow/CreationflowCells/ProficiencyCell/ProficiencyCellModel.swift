//
//  ProficiencyCellModel.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/31/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

struct ProficencyCellModel: CreationFlowCollectionViewCellModel {
    static var reuseID: String {
        CFProficiencyCollectionViewCell.reuseID
    }
    var sourceModel: CreationFlowViewModel
    var collectionView: UICollectionView?
    
    init(sourceModel: CreationFlowViewModel, collectionView: UICollectionView?) {
        self.sourceModel = sourceModel
        self.collectionView = collectionView
    }
}
