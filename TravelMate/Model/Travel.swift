//
//  Travel.swift
//  TravelMate
//
//  Created by Liam Powell on 03/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import Foundation
import os.log

struct Travel: Codable {
    private var name = ""
    private var participants: [Person] = []
    private var spendings: [Spending] = []
    
    //URL for file storage: points to Document directory, then JSON data file
    static public let url = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: .userDomainMask).first!.appendingPathComponent("travels.json", isDirectory: false)
    
    init(n: String, p: [Person], s: [Spending]) {
        name = n
        participants = p
        spendings = s
    }
    
    static public func saveData(travels: [Travel]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(travels)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            fatalError("Saving data failed.")
        }
    }
    
    mutating public func addParticipant(toAdd: Person) {
        participants.append(toAdd)
    }
    
    func currentBudget(index: Int) -> Float {
        if participants.indices.contains(index){
            let currentPerson = participants[index]
            let currentBudget = currentPerson.getBudget() - spendings[index].spendfor()
            return currentBudget
        }
        else {
            return 0
        }
    }
    
    
    func suspens(person: Person) -> Float{
        for 
            for Person in participants {
            
        }
    }
    
    //Data persistence
    mutating public func addSpending(toAdd: Spending) {
        spendings.append(toAdd)
    }
    
    public func getParticipants() -> [Person] {
        return self.participants
    }
    
    public func getSpendings() -> [Spending] {
        return self.spendings
    }
    
    public func getParticipantByReference(reference: Person) -> Person? {
        for participant in participants {
            if(participant === reference) {
                return participant
            }
        }
        return nil
    }
    
    public func getSpendingByReference(reference: Spending) -> Spending? {
        for spending in spendings {
            if(spending == reference) {
                return spending
            }
        }
        return nil
    }


}
