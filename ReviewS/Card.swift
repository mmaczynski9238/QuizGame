//
//  Card.swift
//  ReviewS
//
//  Created by student3 on 10/24/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import Foundation

class Card {
    
    let front: String
    let back: String
    let imagef: String
    let imageb: String
    
    init(front: String, back: String, imagef: String, imageb: String) {
        self.front = front
        self.back = back
        self.imagef = imagef
        self.imageb = imageb
    }
}

class StarredCard {
    
    let frontS: String
    let backS: String
    let imagefS: String
    let imagebS: String
    
    init(frontS: String, backS: String, imagefS: String, imagebS: String) {
        self.frontS = frontS
        self.backS = backS
        self.imagefS = imagefS
        self.imagebS = imagebS
    }
}

