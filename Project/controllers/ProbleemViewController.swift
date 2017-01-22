//
//  ProbleemViewController.swift
//  Project
//
//  Created by Milton on 20/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit
class ProbleemViewController: UIViewController {
    var probleem : Probleem!
    
    @IBOutlet weak var probleemImageView: UIImageView!
    @IBOutlet weak var probleemLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    
    override func viewDidLoad() {
        title = probleem.name
        probleemLabel.text = probleem.name
        probleemImageView.image = probleem.image
        detailsTextView.text = probleem.beschrijving
    
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if !splitViewController!.isCollapsed {
            navigationItem.leftBarButtonItem = splitViewController!.displayModeButtonItem
        }
    }
    
    @IBAction func returnToMenu(){
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
    
}
