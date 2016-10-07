//
//  PairViewController.swift
//  Pair
//
//  Created by Angel Contreras on 10/7/16.
//  Copyright © 2016 Angel Contreras. All rights reserved.
//

import UIKit

class PairViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }
    
    // MARK: - Actions
    @IBAction func randomizeBarButtonPressed(sender: UIBarButtonItem){
        PersonController.sharedController.randomize()
        tableView.reloadData()
    }
}

extension PairViewController: UITableViewDelegate, UITableViewDataSource{
    
    // MARK: - Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return Int( ceil(Double(PersonController.sharedController.persons.count)/2) )
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if PersonController.sharedController.persons.count % 2 != 0 && tableView.numberOfSections - 1 == section {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let index = (indexPath.section * 2) + indexPath.row
        
        let person = PersonController.sharedController.persons[index]
        cell.textLabel?.text = "\(person.fullName)"
        
        return cell
    }
}
