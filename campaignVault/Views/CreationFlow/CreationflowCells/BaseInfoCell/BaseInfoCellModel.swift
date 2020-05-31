//
//  BaseInfoCellModel.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/28/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

struct BaseInfoCellModel: CreationFlowCollectionViewCellModel {
    static var reuseID: String {
        CFBaseInfoCollectionViewCell.reuseID
    }
    var sourceModel: CreationFlowViewModel
    var collectionView: UICollectionView?
    lazy var classes: [SRDResource] = { sourceModel.classes }()
    lazy var subclasses: [SRDResource] = { sourceModel.subclasses }()
    lazy var races: [SRDResource] = { sourceModel.races }()
    lazy var subraces: [SRDResource] = { sourceModel.subraces }()
    
    init(sourceModel: CreationFlowViewModel, collectionView: UICollectionView?) {
        self.sourceModel = sourceModel
        self.collectionView = collectionView
    }
}
