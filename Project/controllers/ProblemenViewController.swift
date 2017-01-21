//
//  ProblemenViewController.swift
//  Project
//
//  Created by Milton on 11/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit
class ProblemenViewController: UITableViewController {
    private var problemen: [Probleem] = [Probleem(name: "TestProbleem", image: #imageLiteral(resourceName: "doge.jpg"), beschrijving: "dit is een testprobleem" )]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return problemen.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "probleemCell", for: indexPath) as! ProbleemCell
        let probleem = problemen[indexPath.row]
        cell.previewImageView.image = probleem.image
        cell.nameLabel.text = "\(probleem.name)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "probleemDetail":
            let destination = segue.destination as! ProbleemViewController
            let selectedIndex = tableView.indexPathForSelectedRow!.row
            destination.probleem = problemen[selectedIndex]
        default:
            break
        }
    }
}
