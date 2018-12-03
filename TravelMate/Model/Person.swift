//
//  Person.swift
//  TravelMate
//
//  Created by Naomi Herimandimby on 03/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import Foundation

class Person: Hashable {
    private var name = ""
    private var budget: Float = 0.0
    var hashValue: Int { return ObjectIdentifier(self).hashValue }
    
    init (n: String ,b: Float){
        name = n
        budget = b
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs === rhs
    }
}
