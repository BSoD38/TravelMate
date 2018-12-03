//
//  Spending.swift
//  TravelMate
//
//  Created by Naomi Herimandimby on 03/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import Foundation

struct Spending {
    private var payer: Person?
    private var payFor: [Person] = []
    private var value: Float = 0.0
    
    init (p1: Person, p2: [Person], v: Float){
        payer = p1
        payFor = p2
        value = v
    }
    
    mutating func payfor(person: Person){
        payFor.append(person)
    }
    
    func spendfor() -> Float{
        let size = Float(payFor.count)
        return value / size
    }
}
