//
//  Spending.swift
//  TravelMate
//
//  Created by Naomi Herimandimby on 03/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import Foundation

struct Spending {
    private var tab: [Person] = []
    private var value: Float = 0.0
    
    init (p: [Person], v: Float){
        tab = p
        value = v
    }
}
