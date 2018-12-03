//
//  Travel.swift
//  TravelMate
//
//  Created by Liam Powell on 03/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import Foundation

class Travel: NSObject, NSCoding {
    private var name = ""
    private var participants: [Person] = []
    private var spendings: [Dictionary<Person, Spending>] = []
    
    
    
    init(n: String) {
        name = n
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(n: self.name)
    }
    
    func encode(with aCoder: NSCoder) {
    }

}
