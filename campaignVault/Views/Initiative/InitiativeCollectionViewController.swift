//
//  InitiativeCollectionViewController.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/11/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class InitiativeCollectionViewController: UICollectionViewController {
    
    private lazy var dataSource: InitiativeDataSource = {
        InitiativeDataSource(collectionView: collectionView)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    func rollInitiative() {
//        dataSource.applySnapshot(with: Coordinators.mocks.combatants)
    }
    
    private func configureCollectionView() {
        let nib = UINib(nibName: InitiativePositionCollectionViewCell.nibID, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: InitiativePositionCollectionViewCell.reuseID)
        collectionView.dataSource = dataSource
        collectionView.delegate = self
    }
}

extension InitiativeCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width - 20
        let height = collectionView.frame.size.height / 5
        
        return CGSize(width: width, height: height)
    }
}
