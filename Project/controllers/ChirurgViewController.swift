//
//  ChirurgViewController.swift
//  Project
//
//  Created by Milton on 22/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit
class ChirurgViewController: UIViewController {
    var chirurg : Chirurg!
    
    @IBOutlet weak var chirurgImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    
    override func viewDidLoad() {
        nameLabel.text = chirurg.name
        chirurgImageView.image = chirurg.image
        chirurgImageView.layer.borderWidth = 1
        chirurgImageView.layer.masksToBounds = false
        chirurgImageView.layer.borderColor = UIColor.black.cgColor
        chirurgImageView.layer.cornerRadius = chirurgImageView.frame.height/2
        chirurgImageView.clipsToBounds = true
        detailsTextView.text = chirurg.details
        
    }
    
    
}
