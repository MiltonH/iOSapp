//
//  Chirurg.swift
//  Project
//
//  Created by Milton on 22/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import UIKit
struct Chirurg {
    
    let name: String
    let image: UIImage
    let details: String
}

extension Chirurg: Hashable {
    
    static func ==(lhs: Chirurg, rhs: Chirurg) -> Bool {
        return lhs.name == rhs.name
            && lhs.image == rhs.image
            && lhs.details == rhs.details
    }
    
    var hashValue: Int {
        return name.hashValue
    }
}

extension Chirurg: Comparable {
    
    static func <(lhs: Chirurg, rhs: Chirurg) -> Bool {
        return lhs.name < rhs.name
    }
}
