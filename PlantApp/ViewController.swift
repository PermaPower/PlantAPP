//
//  ViewController.swift
//  PlantApp
//
//  Created by MacOS on 3/5/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Plants"
        
        setupNavigationStyle()
        
        setupNavigationButtons()
  
    }
    
    func setupNavigationStyle() {

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .navigationBarColor
        navigationController?.navigationBar.tintColor = .navigationBarTextColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.navigationBarTextColor]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.navigationBarTextColor]
    }
    
    func setupNavigationButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddPlantsButton))
    }
    
    @objc func handleAddPlantsButton() {
        print ("Add button pressed")
    }
  
}

