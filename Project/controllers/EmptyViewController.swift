//
//  EmptyChirugViewController.swift
//  Project
//
//  Created by Milton on 22/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit

class EmptyViewController: UIViewController {
    
    override func viewDidLoad() {
        navigationItem.leftBarButtonItem = splitViewController!.displayModeButtonItem
    }
    
    @IBAction func returnToMenu(){
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
}
