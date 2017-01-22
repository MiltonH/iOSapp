//
//  ProblemenViewController.swift
//  Project
//
//  Created by Milton on 11/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit
class ProblemenViewController: UITableViewController {
    private var problemen: [Probleem] = [Probleem(name: "Impingement", image: #imageLiteral(resourceName: "impingement.png"), beschrijving: "Wanneer de pezen van de schouder chronisch ingeklemd geraken tussen het dak van de schouder en de bovenarm, spreekt men van een impingement syndroom van de schouder. Dit veroorzaakt pijn in de bovenarm met een typisch pijnpatroon." ),
                                         Probleem(name: "AC arthrose", image: #imageLiteral(resourceName: "AC2.png"), beschrijving: "Het acromio claviculair gewricht, ook wel het AC gewricht genoemd, is de verbinding tussen sleutelbeen (clavicula) en acromion, deel van schouderblad (scapula)." ),
                                         Probleem(name: "Bicepspees degeneratie", image: #imageLiteral(resourceName: "biceps1.png"), beschrijving: "Een Biceps tendinopathie is een overbelastingsletsel van de bicepspees. Deze aandoening wordt gekarakteriseerd door weefselschade in de pees, wat pijn geeft aan de voorkant van de schouder of elleboog. Deze aandoenig kan zowel voorkomen in de elleboog en schouder omdat de pees vasthecht aan de elleboog en schouder." ),
                                         Probleem(name: "Rotatorcuff scheur", image: #imageLiteral(resourceName: "RC1.png"), beschrijving: "Een ‘rotator cuff' is een peesblad, bestaande uit het uiteinde van 4 spieren rond de schouder. De functie van de ‘rotator cuff' is zorgen voor de stabiliteit van het schoudergewricht en voor het bewegen van de arm door het selectief aantrekken van de verschillende spiergroepen." ),
                                         Probleem(name: "Calcifiërende tendinitis", image: #imageLiteral(resourceName: "calcifying2.png"), beschrijving: "Het gaat per definitie om een afzetting van calciumkristallen in één van de pezen. In het bijzonder gaat het hier om calcificaties (kalkafzettingen) in de pezen rond de schouderkop (meer bepaald de ‘rotator cuff' pezen). Deze calcificaties ontstaan niet na een ongeval en zelfs niet na een overbelasting. Men denkt dat ze ontstaan in een zone van verminderde bloeddoorstroming waarbij bepaalde cellen worden aangespoord tot het verkeerdelijk vormen van calcium." ),
                                         Probleem(name: "Labrumscheur", image: #imageLiteral(resourceName: "labrum1.png"), beschrijving: "Het zachte materiaal van het labrum kan klem komen te zitten tussen het glenoïd en de kop van de humerus. Wanneer dit gebeurt, kan het labrumweefsel gaan scheuren. Als het erger wordt, kan het een flap van weefsel worden dat in en uit het gewricht gaat. De flap veroorzaakt pijn en gevoel van inklemming als de schouder bewogen wordt. Verschillende pezen en ligamenten hechten aan het labrum, deze helpen om de stabiliteit van het gewricht te waarborgen. Dus als het labrum scheurt, wordt de schouder vaak minder stabiel." )]
    
    override func viewDidLoad() {
        splitViewController!.delegate = self
    }
    
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
        cell.previewImageView.layer.cornerRadius = 5
        cell.previewImageView.clipsToBounds = true
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "probleemDetail":
            let navigationController = segue.destination as! UINavigationController
            let probleemViewController = navigationController.topViewController as! ProbleemViewController
            let selectedIndex = tableView.indexPathForSelectedRow!.row
            probleemViewController.probleem = problemen[selectedIndex]
        default:
            break
        }
    }
}

extension ProblemenViewController: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        print(splitViewController.traitCollection)
        print(secondaryViewController.traitCollection)
        return true
    }
}
