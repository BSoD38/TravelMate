//
//  Spending.swift
//  TravelMate
//
//  Created by Naomi Herimandimby on 03/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import Foundation

struct Spending: Equatable, Codable {
    private var payer: Person?
    private var payFor: [Person] = []
    private var hasPaid: [Person] = []
    private var value: Float = 0.0
    
    init (p1: Person, p2: [Person], v: Float){
        payer = p1
        payFor = p2
        value = v
    }
    
    //Custom == operator
    static func == (lhs: Spending, rhs: Spending) -> Bool {
        if lhs.value == rhs.value {
            for (index, person) in lhs.payFor.enumerated() {
                if rhs.payFor.indices.contains(index) {
                    if person != rhs.payFor[index] {
                        return false
                    }
                } else {
                    return false
                }
            }
        } else {
            return false
        }
        return true
    }
    
    private func haspaid(person: Person) -> Bool{
        for person2 in hasPaid{
            if person2 == person {
                return true
            }
        }
        return false
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
