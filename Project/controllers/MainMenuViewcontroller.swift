//
//  MainMenuViewController.swift
//  Project
//
//  Created by Milton on 06/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit
import RealmSwift

class MainMenuViewController: UICollectionViewController {
    
    var model: MainMenuModel!
    let reuseIdentifier = "MainMenuCell"
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    var itemsPerRow: CGFloat = 3
    
    //realm testing
    var items = List<ProbleemAdapter>()
    var notificationToken: NotificationToken!
    var realm: Realm!
    
    override func viewDidLoad() {
        setupRealm()
    }
    
    func setupRealm() {
        // Log in existing user with username and password
        let username = "test@test.be"  // <--- Update this
        let password = "test"  // <--- Update this
        
        SyncUser.logIn(with: .usernamePassword(username: username, password: password, register: false), server: URL(string: "http://127.0.0.1:9080")!) { user, error in
            guard let user = user else {
                fatalError(String(describing: error))
            }
            
            DispatchQueue.main.async {
                // Open Realm
                let configuration = Realm.Configuration(
                    syncConfiguration: SyncConfiguration(user: user, realmURL: URL(string: "realm://127.0.0.1:9080/~/realmtasks")!)
                )
                self.realm = try! Realm(configuration: configuration)
                
                // Show initial tasks
                func updateList() {
                    if self.items.realm == nil, let list = self.realm.objects(ProbleemList.self).first {
                        self.items = list.items
                        print("realm stuff done")
                    }
                    
                }
                updateList()
                
                // Notify us when Realm changes
                self.notificationToken = self.realm.addNotificationBlock { _ in
                    updateList()
                }
            }
        }
    }
    
    deinit {
        notificationToken.stop()
    }
    
    //end realm testing
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Switched to Landscape")
            itemsPerRow = 3
            collectionView?.reloadData()
        } else {
            print("Switched to Portrait")
            itemsPerRow = 2
            collectionView?.reloadData()
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,for: indexPath) as! MainMenuCell
        cell.MenuItem.image = UIImage(named: model.menuItems[indexPath.item])
        cell.MenuItem.layer.cornerRadius = 10
        cell.MenuItem.clipsToBounds = true
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = model.menuItems[indexPath.row]
            print("Selected item: " + selectedItem)
        performSegue(withIdentifier: selectedItem + "Segue" , sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "problemen":
            break
        default:
            break
        }
    }
}

extension MainMenuViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
