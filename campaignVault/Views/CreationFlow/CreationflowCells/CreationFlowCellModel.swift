//
//  CreationFlowCellModel.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/29/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit
protocol CreationFlowCollectionViewCell {
    associatedtype Model where Model: CreationFlowCollectionViewCellModel
    
    func configure(with model: Model)
}

protocol CreationFlowCollectionViewCellModel {
    static var reuseID: String { get }
    var sourceModel: CreationFlowViewModel { get }
    var collectionView: UICollectionView? { get }
    
    init(sourceModel: CreationFlowViewModel, collectionView: UICollectionView?)
}

struct CreationFlowCellModel {
    let reuseID: String
    let sourceModel: CreationFlowViewModel
    let configure: (UICollectionViewCell) -> Void
    private let uuid = UUID()
    
    static func createModel<T>(_: T.Type, model: T.Model) -> CreationFlowCellModel where T: UICollectionViewCell, T: CreationFlowCollectionViewCell {
        let modelConfigure: (UICollectionViewCell) -> Void = { cell in
            guard let cell = cell as? T else { return }
            cell.configure(with: model)
        }
        
        return CreationFlowCellModel(reuseID: T.Model.reuseID, sourceModel: model.sourceModel, configure: modelConfigure)
    }
    
    private init(reuseID: String, sourceModel: CreationFlowViewModel, configure: @escaping (UICollectionViewCell) -> Void) {
        self.reuseID = reuseID
        self.sourceModel = sourceModel
        self.configure = configure
    }
}

extension CreationFlowCellModel: Hashable {
    static func == (lhs: CreationFlowCellModel, rhs: CreationFlowCellModel) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
//
//struct CreationFlowCellModel: Hashable {
//    let reuseID: String
//    let sourceModel: CreationFlowViewModel
//    let configure: (UICollectionViewCell) -> Void
//    let cellHeight: (CGFloat) -> CGFloat
//    
//    static func model<T>(_: T.Type, model: T.Model, traits: UITraitCollection) -> CreationFlowCellModel where T: UICollectionViewCell {
//        
//        let modelConfigure: (UICollectionViewCell) -> Void = { cell in
//            guard let cell = cell as? T else { return }
//            cell.configure
//        }
//    }
//}
