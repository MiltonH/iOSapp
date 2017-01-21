//
//  Probleem.swift
//  Project
//
//  Created by Milton on 11/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit
struct Probleem {
    
    let name: String
    let image: UIImage
    let beschrijving: String
}

extension Probleem: Hashable {
    
    static func ==(lhs: Probleem, rhs: Probleem) -> Bool {
        return lhs.name == rhs.name
            && lhs.image == rhs.image
            && lhs.beschrijving == rhs.beschrijving
    }
    
    var hashValue: Int {
        return name.hashValue
    }
}

extension Probleem: Comparable {
    
    static func <(lhs: Probleem, rhs: Probleem) -> Bool {
        return lhs.name < rhs.name
    }
}
