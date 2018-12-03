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
    
    static public func loadData() -> [Travel] {
        if !FileManager.default.fileExists(atPath: url.path) {
            print("File \(url.path) was not found.")
            return []
        } else {
            if let data = FileManager.default.contents(atPath: url.path) {
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode([Travel].self, from: data)
                    return model
                } catch {
                    fatalError("Unknown fatal error when loading data.")
                }
            } else {
                print("No data at \(url.path)!")
                return []
            }
        }
    }
    
    static public func deleteData() {
        if FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.removeItem(at: url)
            } catch {
                fatalError("Failure to delete file.")
            }
        }
    }
    
    mutating public func addParticipant(toAdd: Person) {
        participants.append(toAdd)
    }
   
    //Calcul budget
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
    
    //Retourne le to
    func suspens(person: Person) -> [Float]{
        var currentDebt: [Float] = []
        for spending in spendings {
            for person2 in participants {
                if person2 == person{
                    currentDebt += [spending.spendfor()]
                }
            }
        }
        return currentDebt
    }
    
    //Retourne le total que l'utilisateur doit aux autres participants
    func suspensT(person: Person) -> Float{
        var currentDebt: Float = 0.0
        for spending in spendings {
            for person2 in participants {
                if person2 == person{
                    currentDebt += spending.spendfor()
                }
            }
        }
        return currentDebt
    }
    
    //Retourne tableau des sommes que les participants doivent à cet utilisateur
    func forMe(person: Person) -> [Float]{
        var forme: [Float] = []
        for spending in spendings {
            for person2 in participants {
                if person2 != person{
                    forme += [spending.spendfor()]
                }
            }
        }
        return forme
    }
    
    //Retourne le total des sommes que les participants doivent à cet utilisateur
    func forMeT(person: Person) -> Float{
        var formet: Float = 0.0
        for spending in spendings {
            for person2 in participants {
                if person2 != person{
                    formet += spending.spendfor()
                }
            }
        }
        return formet
    }
    
    func whoPay (person: Person) -> [Person]? {
        var tab: [Person] = []
        for spending in spendings {
            for person2 in participants {
                if person2 != person{
                    tab += [person]
                    return tab
                }
            }
        }
        return nil
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

    public func getName() -> String {
        return self.name
    }
    
    mutating public func setName(name: String) {
        self.name = name
    }
}
