//
//  AfsprekenController.swift
//  Project
//
//  Created by Milton on 22/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit
class AfsprekenViewController: UIViewController {
    @IBOutlet weak var info: UITextView!
    
    override func viewDidLoad() {
        info.text = "Zoals gewoonlijk raadpleegt u best eerst uw huisarts. Indien nodig verwijst hij u door naar een van onze specialisten. Bij een dringend probleem kan hij of zij ons persoonlijk contacteren om een afspraak vast te leggen."
    }
    
    @IBAction func openWebsite(sender: AnyObject) {
        let url = URL(string: "http://www.orthopedie-ronse.be")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    @IBAction func sendMail(sender: AnyObject) {
        let email = "info@orthopedie-ronse.be"
        let url = NSURL(string: "mailto:\(email)")
        UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
    }
    
}
