//
//  Person.swift
//  TravelMate
//
//  Created by Naomi Herimandimby on 03/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import Foundation

class Person: Equatable, Codable {
    private var name = ""
    private var budget: Float = 0.0
    
    init (n: String ,b: Float){
        name = n
        budget = b
    }
    
    //Custom == operator
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
    
    public func getBudget() -> Float{
        return budget
    }
    
    public func getName() -> String {
        return name
    }
}
