//
//  CFBaseInfoCollectionViewCell.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class CFBaseInfoCollectionViewCell: UICollectionViewCell, CellIdentifiable, CreationFlowCollectionViewCell {
    static let nibID = "BaseInfoCell"
    static let reuseID = "CFBaseInfoCollectionViewCell"
    
    func configure(with model: BaseInfoCellModel) {
        
    }
}

