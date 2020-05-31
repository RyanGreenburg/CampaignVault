//
//  BasicTextCollectionViewCell.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class BasicTextCollectionViewCell: UICollectionViewCell, CellIdentifiable {
    
    static let nibID = "BasicTextCollectionViewCell"
    static let reuseID = "BasicTextCollectionViewCell"
    
    @IBOutlet weak var baseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
