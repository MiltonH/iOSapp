//
//  ChirurgenViewController.swift
//  Project
//
//  Created by Milton on 22/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit
class ChirurgenViewController: UITableViewController {
    private var chirurgenList: [Chirurg] = [Chirurg(name: "Dr. Olivier Zeegers", image:#imageLiteral(resourceName: "drZeegers.jpg"), details: "details komen hier     sdfsdfsdfsdgdsfgsdbgjhsfudijsvisdfivfdjhvbdfsbvfhdivbfdsjivn fdjocnvfjifd" )]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chirurgenList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "chirurgCell", for: indexPath) as! ChirurgCell
        let chirurg = chirurgenList[indexPath.row]
        cell.imageImageView.image = chirurg.image
        cell.nameLabel.text = "\(chirurg.name)"
        cell.imageImageView.layer.borderWidth = 1
        cell.imageImageView.layer.masksToBounds = false
        cell.imageImageView.layer.borderColor = UIColor.black.cgColor
        cell.imageImageView.layer.cornerRadius = cell.imageImageView.frame.height/2
        cell.imageImageView.clipsToBounds = true
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "chirurgDetail":
            let destination = segue.destination as! ChirurgViewController
            let selectedIndex = tableView.indexPathForSelectedRow!.row
            destination.chirurg = chirurgenList[selectedIndex]
        default:
            break
        }
    }
}
