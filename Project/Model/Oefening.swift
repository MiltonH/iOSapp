//
//  Oefening.swift
//  Project
//
//  Created by Milton on 21/01/2017.
//  Copyright © 2017 Milton. All rights reserved.
//

import Foundation
import UIKit
struct Oefening {
    
    let name: String
    let thumbnail: UIImage
    let videoName: String
}

extension Oefening: Hashable {
    
    static func ==(lhs: Oefening, rhs: Oefening) -> Bool {
        return lhs.name == rhs.name
            && lhs.thumbnail == rhs.thumbnail
            && lhs.videoName == rhs.videoName
    }
    
    var hashValue: Int {
        return name.hashValue
    }
}

extension Oefening: Comparable {
    
    static func <(lhs: Oefening, rhs: Oefening) -> Bool {
        return lhs.name < rhs.name
    }
}
