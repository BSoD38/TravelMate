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
    private var hasPaid: [Person] = []
    private var value: Float = 0.0
    
    init (p1: Person, p2: [Person], v: Float){
        payer = p1
        payFor = p2
        value = v
    }
    
    private func haspaid(person: Person) -> Bool{
        for Person in hasPaid{
            return Person == person
        }
    }
    
    mutating func listHasPaid(person: Person){
        if haspaid(person: person) == false{
            hasPaid.append(person)
        }
    }
    
    mutating func payfor(person: Person){
        payFor.append(person)
    }
    
    func spendfor() -> Float{
        let size = Float(payFor.count)
        return value / size
    }

}
