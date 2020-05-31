//
//  CreationFlowViewController.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class CreationFlowViewController: UIViewController {
    var resouces: [SRDResources] = []
    var viewModel = CreationFlowViewModel()
    lazy var dataSource: CFDataSource = {
        CFDataSource(collectionView: collectionView, model: viewModel)
    }()

    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        registerCells()
        collectionView.dataSource = dataSource
//        collectionView.delegate = dataSource
//        let baseInfoCellModel = BaseInfoCellModel()
    }
    
    private func registerCells() {
        let baseInfoNib = UINib(nibName: CFBaseInfoCollectionViewCell.nibID, bundle: nil)
        collectionView.register(baseInfoNib, forCellWithReuseIdentifier: CFBaseInfoCollectionViewCell.reuseID)
        let abilityScoreNib = UINib(nibName: CFAbilityScoreCollectionViewCell.nibID, bundle: nil)
        collectionView.register(abilityScoreNib, forCellWithReuseIdentifier: CFAbilityScoreCollectionViewCell.reuseID)
        let backgroundNib = UINib(nibName: CFBackgroundCollectionViewCell.nibID, bundle: nil)
        collectionView.register(backgroundNib, forCellWithReuseIdentifier: CFBackgroundCollectionViewCell.reuseID)
        let proficiencyNib = UINib(nibName: CFProficiencyCollectionViewCell.nibID, bundle: nil)
        collectionView.register(proficiencyNib, forCellWithReuseIdentifier: CFProficiencyCollectionViewCell.reuseID)
    }
}
