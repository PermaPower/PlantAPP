//
//  CreatePlantController.swift
//  PlantApp
//
//  Created by MacOS on 3/5/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

// Properties
let plantType = ["Tree", "Seed", "Seedling"]

// Activity months
let activityMonths = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]

// Toggle Button
var toggleButton = Array(repeating: false, count: 12)

protocol CreatePlantControllerDelegate {
    func didAddPlant(plantDeleagate: Plant)
}

class CreatePlantController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
    
    let plantPicker: UIPickerView = {
        let plantPickerView = UIPickerView()
        plantPickerView.translatesAutoresizingMaskIntoConstraints = false
        return plantPickerView
    }()
    
    let pickerLabel: UILabel = {
        let label = UILabel()
        label.text = "Type"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let activityMonthTextField: UILabel = {
        let textField = UILabel()
        textField.text = "Activity Month"
        textField.numberOfLines = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let activityMonthStackView: UIView = {
 
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false

       return stackView
    }()
    
   
    override func viewDidLoad() {
        
        view.backgroundColor = .cdarkBlue
        
        navigationItem.title = "Create Plant"
        
        setupNavigationButtons()
        
        plantPicker.dataSource = self
        plantPicker.delegate = self
        
        setupUI()
    }
    
    private func fitParentLayout(_ child: UIView, parentView: UIView) {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parentView.leadingAnchor.constraint(equalTo: child.leadingAnchor),
            parentView.trailingAnchor.constraint(equalTo: child.trailingAnchor),
            parentView.topAnchor.constraint(equalTo: child.topAnchor),
            parentView.heightAnchor.constraint(equalTo: child.heightAnchor)])
    }
    
    private func setupNavigationButtons(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancelPlantsCreateButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSavePlantsCreateButton))
        
    }
    
    private func createGrid(x: Int, y: Int, rootView: UIView) {
        
        //Init stack view.
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        // Reset Button Number
        var buttonNumber = 0

        for _ in 1...x {
            let hStackView = UIStackView()
            hStackView.axis = .horizontal
            hStackView.alignment = .fill
            hStackView.distribution = .fillEqually
            hStackView.spacing = 10
            
            
            for _ in 1...y {
                let button = CustomCalendarButton()
                button.tag = buttonNumber
                button.contentMode = .scaleAspectFit
                button.setTitle(activityMonths[buttonNumber], for: .normal)
                buttonNumber = buttonNumber + 1
                button.titleLabel?.adjustsFontSizeToFitWidth = true
                button.titleLabel?.numberOfLines = 1
                button.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
                hStackView.addArrangedSubview(button)
            }
            
            //Add horizontal row stack to vertical parent stack.
            stackView.addArrangedSubview(hStackView)
        }

        
        rootView.addSubview(stackView)
        
        //setup stack view bounds
        fitParentLayout(stackView, parentView: rootView)
    }
    
    private func setupUI(){
        
        view.addSubview(backgroundColorForView)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(pickerLabel)
        view.addSubview(plantPicker)
        view.addSubview(activityMonthTextField)
        view.addSubview(activityMonthStackView)
        
        backgroundColorForView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundColorForView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundColorForView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        pickerLabel.topAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pickerLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        pickerLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pickerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        plantPicker.topAnchor.constraint(equalTo: nameTextField.safeAreaLayoutGuide.bottomAnchor).isActive = true
        plantPicker.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        plantPicker.leftAnchor.constraint(equalTo: pickerLabel.safeAreaLayoutGuide.rightAnchor).isActive = true
        plantPicker.bottomAnchor.constraint(equalTo: pickerLabel.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        activityMonthTextField.topAnchor.constraint(equalTo: plantPicker.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        activityMonthTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        activityMonthTextField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        activityMonthTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        activityMonthStackView.topAnchor.constraint(equalTo: plantPicker.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        activityMonthStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        activityMonthStackView.leftAnchor.constraint(equalTo: activityMonthTextField.safeAreaLayoutGuide.rightAnchor).isActive = true
        activityMonthStackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        createGrid(x: 4, y: 3, rootView: activityMonthStackView)
       
        backgroundColorForView.bottomAnchor.constraint(equalTo: activityMonthStackView.bottomAnchor, constant: 20).isActive = true
        
    }
    
    @objc func handleCancelPlantsCreateButton(){
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSavePlantsCreateButton(){
        
        dismiss(animated: true) {
            // Execute Code after dismissal has taken place
            
            guard let plantName = self.nameTextField.text else { return }
            
            let newPlant = Plant(name: plantName, date: Date())
        
            self.delegate?.didAddPlant(plantDeleagate: newPlant)
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return plantType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return plantType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
            let pLabel: UIView = {
                let pLabel = UILabel()
                pLabel.textAlignment = .left
                pLabel.text = plantType[row]
                pLabel.textColor = .lightGray
                return pLabel
        }()
        
        return pLabel
    }
  
}
