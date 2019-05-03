//
//  ViewController.swift
//  PlantApp
//
//  Created by MacOS on 3/5/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

class PlantController: UITableViewController {
    
    let cellId = "CellID"
    
    let plants = [
        Plant(name: "Plant A", date: Date()),
        Plant(name: "Plant B", date: Date()),
        Plant(name: "Plant C", date: Date())
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Plants"
        
        setupNavigationButtons()
        
        setupTableView()
    }
    
    func setupNavigationButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddPlantsButton))
    }
    
    func setupTableView() {
        
        // tableView.separatorStyle = .none
        tableView.separatorColor = .cWhite
        tableView.backgroundColor = .cdarkBlue
        
        // Register tableViewCells
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        // Change the tableFooter to a blank view to hide row lines
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let plant = plants[indexPath.row]
        cell.textLabel?.text = plant.name
        
        cell.textLabel?.textColor = .cWhite
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        cell.backgroundColor = .cTeal
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plants.count
    }
    
    @objc func handleAddPlantsButton() {
        print ("Add button pressed")
        
        let createCompanyController = CreatePlantController()
        let navController = CustomNavigationController(rootViewController: createCompanyController)

        present(navController, animated: true, completion: nil)
    }
  
}

