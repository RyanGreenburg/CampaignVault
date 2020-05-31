//
//  MainViewController.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/11/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var initController: InitiativeCollectionViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func rollInitButtonTapped(_ sender: Any) {
        initController?.rollInitiative()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InitiativeContainer" {
            if let vc = segue.destination as? InitiativeCollectionViewController {
                self.initController = vc
            }
        }
    }
}
