//
//  PairViewController.swift
//  Pair
//
//  Created by Angel Contreras on 10/7/16.
//  Copyright © 2016 Angel Contreras. All rights reserved.
//

import UIKit

class PairTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func randomizeBarButtonPressed(sender: UIBarButtonItem){
        PersonController.sharedController.randomize()
        tableView.reloadData()
    }
    
    @IBAction func addBarButtonPressed(sender: UIBarButtonItem){
        let alertController = UIAlertController(title: "Enter Full Name", message: "Please Enter Full Name of Person", preferredStyle: .alert)
        var nameTextField = UITextField()
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Full Name"
            nameTextField = textField
        }
        
        let okAlertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            guard let fullName = nameTextField.text else { return }
            PersonController.sharedController.addPerson(fullname: fullName)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addAction(okAlertAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - TableViewDelagate/DataSource
extension PairTableViewController{
    
    // MARK: - Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Int( ceil(Double(PersonController.sharedController.persons.count)/2) )
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group \(section + 1)"
    }
    
    // MARK: - Rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if PersonController.sharedController.persons.count % 2 != 0 && tableView.numberOfSections - 1 == section {
            return 1
        } else {
            return 2
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let index = (indexPath.section * 2) + indexPath.row
        
        let person = PersonController.sharedController.persons[index]
        cell.textLabel?.text = "\(person.fullName)"
        
        return cell
    }
}

//// MARK: - Popover
//extension PairViewController: UIPopoverPresentationControllerDelegate{
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "popoverSegue"{
//            let addPersonVC = segue.destination as! AddPersonViewController
//            addPersonVC.modalPresentationStyle = UIModalPresentationStyle.popover
//            addPersonVC.popoverPresentationController?.delegate = self
//        }
//    }
//    
//    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//        return UIModalPresentationStyle.none
//    }
//}
