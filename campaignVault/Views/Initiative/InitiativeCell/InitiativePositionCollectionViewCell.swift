//
//  InitiativePositionCollectionViewCell.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/11/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class InitiativePositionCollectionViewCell: UICollectionViewCell {
    static let nibID = "InitiativePositionCell"
    static let reuseID = "InitiativePositionCell"
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var positionLabel: UILabel!
    @IBOutlet weak var hitPointsLabel: UILabel!
    @IBOutlet weak var armorClassLabel: UILabel!
    @IBOutlet weak var passivePerceptionLabel: UILabel!
    
    func configureWith(_ model: InitiativePositionCellModel) {
        nameLabel.text = model.nameText
        positionLabel.text = model.positionText
        backgroundColor = .gray
    }
}
