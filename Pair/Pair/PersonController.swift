//
//  PersonController.swift
//  Pair
//
//  Created by Angel Contreras on 10/7/16.
//  Copyright © 2016 Angel Contreras. All rights reserved.
//

import Foundation

extension Array{
    mutating func randomize(){
        for _ in 0..<10{ sort { (_,_) in arc4random() < arc4random() } }
    } /* Credit: https: //gist.github.com/ijoshsmith/ */
}

class PersonController{
    
    struct keys{
        static let kPerson = "person"
    }

    static let sharedController = PersonController()
    
    var persons: [Person] = []
    
    init(){
        loadFromPersistStore()
    }
    
    func randomize(){
        persons.randomize()
        savedToPersistStore()
    }
}

// MARK: - CRUD Methods
extension PersonController{
    func addPerson(fullname: String){
        let newPerson = Person(fullName: fullname)
        self.persons.append(newPerson)
        savedToPersistStore()
    }
    
    func removePerson(person: Person){
        guard let index = persons.index(of: person) else { return }
        persons.remove(at: index)
        savedToPersistStore()
    }
}

// MARK: - Pesist
extension PersonController{
    func savedToPersistStore(){
        let dictionaryArray = persons.map{$0.dictionaryRepresentation}
        UserDefaults.standard.set(dictionaryArray, forKey: keys.kPerson)
    }
    
    func loadFromPersistStore(){
        guard let personsDictionaryArray = UserDefaults.standard.object(forKey: keys.kPerson) as? [[String: Any]]
            else { return }
        self.persons = personsDictionaryArray.flatMap{Person(dictionary: $0)}
    }
}
