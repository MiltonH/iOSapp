//
//  glorieuxViewController.swift
//  Project
//
//  Created by Milton on 22/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit
class GlorieuxViewController: UIViewController {
    
    @IBAction func openGlorieuxWebsite(sender: AnyObject) {
        let url = URL(string: "http://www.azglorieux.be/")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    
}
