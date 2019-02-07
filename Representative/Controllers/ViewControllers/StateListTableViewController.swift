//
//  StateListTableViewController.swift
//  Representative
//
//  Created by XMS_JZhan on 2/7/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        cell.textLabel?.text = States.all[indexPath.row]
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
        if segue.identifier == "showStateSegue" {
            if let destinationVC = segue.destination as? StateDetailTableViewController {
                guard let indexPath = tableView.indexPathForSelectedRow else { return }
                destinationVC.state = States.all[indexPath.row]
            }
        }
    }
}
