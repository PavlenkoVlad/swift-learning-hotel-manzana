//
//  RegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Владислав Павленко on 7/11/19.
//  Copyright © 2019 Владислав Павленко. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    
    var registrations: [Registration] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registrations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        let registration = registrations[indexPath.row]
        
        cell.textLabel?.text = registration.firstName + " " + registration.lastName
        cell.detailTextLabel?.text = dateFormatter.string(from: registration.checkInDate) + " - " + dateFormatter.string(from: registration.checkOutDate) + ": " + registration.roomType.name
        
        return cell
    }

    @IBAction func unwindFromAddRegistration(segue: UIStoryboardSegue) {
        guard let addRegistrationTableViewController = segue.source as? AddRegistrationTableViewController, let registration = addRegistrationTableViewController.registration else { return }
        
        registrations.append(registration)
        tableView.reloadData()
    }

}
