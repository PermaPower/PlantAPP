//
//  CreatePlantController.swift
//  PlantApp
//
//  Created by MacOS on 3/5/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

protocol CreatePlantControllerDelegate {
    func didAddPlant(plant: Plant)
}

class CreatePlantController: UIViewController {
    
    // Link the controllers
    var delegate: CreatePlantControllerDelegate?
    
    let backgroundColorForView: UIView = {
        let view = UIView()
        view.backgroundColor = .clightBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        
        view.backgroundColor = .cdarkBlue
        
        navigationItem.title = "Create Plant"
        
        setupNavigationButtons()
        
        setupUI()
    }
    
    private func setupNavigationButtons(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancelPlantsCreateButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSavePlantsCreateButton))
        
    }
    
    private func setupUI(){
        
        view.addSubview(backgroundColorForView)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        
        backgroundColorForView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundColorForView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundColorForView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundColorForView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
    }
    
    @objc func handleCancelPlantsCreateButton(){
        print("Cancel button pressed")
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSavePlantsCreateButton(){
        print("Save button pressed")
        
        dismiss(animated: true) {
            // Execute Code after dismissal has taken place
            
            guard let plantName = self.nameTextField.text else { return }
            
            let newPlant = Plant(name: plantName, date: Date())
        
            self.delegate?.didAddPlant(plant: newPlant)
        }
        
    }
    
}
