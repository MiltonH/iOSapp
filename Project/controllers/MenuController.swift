//
//  MenuController.swift
//  Project
//
//  Created by Milton on 06/12/2016.
//  Copyright © 2016 Milton. All rights reserved.
//

import UIKit
class MenuController: UITableViewController {
    @IBOutlet weak var oefeningenView: UIImageView?
    @IBOutlet weak var problemenView: UIImageView?
    @IBOutlet weak var chirurgenView: UIImageView?
    @IBOutlet weak var dienstView: UIImageView?
    @IBOutlet weak var glorieuxView: UIImageView?
    @IBOutlet weak var afspreekView: UIImageView?
    
    override func viewDidLoad() {
        tableView.separatorStyle = .none
        oefeningenView?.layer.cornerRadius = 10
        oefeningenView?.clipsToBounds = true
        problemenView?.layer.cornerRadius = 10
        problemenView?.clipsToBounds = true
        chirurgenView?.layer.cornerRadius = 10
        chirurgenView?.clipsToBounds = true
        dienstView?.layer.cornerRadius = 10
        dienstView?.clipsToBounds = true
        glorieuxView?.layer.cornerRadius = 10
        glorieuxView?.clipsToBounds = true
        afspreekView?.layer.cornerRadius = 10
        afspreekView?.clipsToBounds = true
    }
}
