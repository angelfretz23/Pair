//
//  AddPersonViewController.swift
//  Pair
//
//  Created by Angel Contreras on 10/7/16.
//  Copyright © 2016 Angel Contreras. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonPRessed(sender: UIButton){
        guard let fullName = fullNameTextField.text, !fullName.isEmpty else { return }
        
        PersonController.sharedController.addPerson(fullname: fullName)
        
        fullNameTextField.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
}
