//
//  PairViewController.swift
//  Pair
//
//  Created by Angel Contreras on 10/7/16.
//  Copyright © 2016 Angel Contreras. All rights reserved.
//

import UIKit

class PairViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension PairViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
