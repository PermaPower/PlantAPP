//
//  CreatePlantController.swift
//  PlantApp
//
//  Created by MacOS on 3/5/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

class CreatePlantController: UIViewController {
    override func viewDidLoad() {
        
        view.backgroundColor = .cdarkBlue
        
        navigationItem.title = "Create Plant"
        
        setupNavigationButtons()
    }
    
    func setupNavigationButtons(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancelPlantsCreateButton))
        
    }
    
    @objc func handleCancelPlantsCreateButton(){
        print("Cancel button pressed")
        
        dismiss(animated: true, completion: nil)
    }
}
