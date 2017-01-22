//
//  OefeningenViewController.swift
//  Project
//
//  Created by Milton on 21/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit
class OefeningenViewController: UITableViewController {
    private var oefeningnen: [Oefening] = [Oefening(name: "TestOefening", thumbnail: #imageLiteral(resourceName: "doge.jpg"), videoName: "voorbeeldvideo" )]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oefeningnen.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "oefeningCell", for: indexPath) as! OefeningCell
        let oefening = oefeningnen[indexPath.row]
        cell.thumbnailImageView.image = oefening.thumbnail
        cell.nameLabel.text = "\(oefening.name)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "oefeningDetail":
            let destination = segue.destination as! VideoPlayerViewController
            let selectedIndex = tableView.indexPathForSelectedRow!.row
            destination.videoName = oefeningnen[selectedIndex].videoName
        default:
            break
        }
    }
}
