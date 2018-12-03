//
//  Travel.swift
//  TravelMate
//
//  Created by Liam Powell on 03/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import Foundation
import os.log

class Travel: NSObject, NSCoding {
    private var name = ""
    private var participants: [Person] = []
    private var spendings: [Spending] = []
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("travels")
    
    struct PropertyKey {
        static let name = "name"
        static let participants = "participants"
        static let spendings = "spendings"
    }
    
    
    init(n: String, p: [Person], s: [Spending]) {
        name = n
    }
    
    //Data persistence
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else{
            os_log("Unable to decode name in Travel object", log: OSLog.default, type: .debug)
            return nil
        }
        guard let participants = aDecoder.decodeObject(forKey: PropertyKey.participants) as? [Person] else{
            os_log("Unable to decode participants in Travel object", log: OSLog.default, type: .debug)
            return nil
        }
        guard let spendings = aDecoder.decodeObject(forKey: PropertyKey.participants) as? [Spending] else{
            os_log("Unable to decode spendings in Travel object", log: OSLog.default, type: .debug)
            return nil
        }
        self.init(n: name, p: participants, s: spendings)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(participants, forKey: PropertyKey.participants)
        aCoder.encode(spendings, forKey: PropertyKey.spendings)
    }

}
