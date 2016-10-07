//
//  Person.swift
//  Pair
//
//  Created by Angel Contreras on 10/7/16.
//  Copyright © 2016 Angel Contreras. All rights reserved.
//

import Foundation

class Person{
    let firstName: String
    let lastName: String
    let identifier: UUID // Just in case there is a person with the same name
    
    struct keys{
        static let kFirstName = "firstName"
        static let kLastName = "lastName"
        static let kIdentifier = "identifier"
    }
    
    init(firstName: String, lastName: String, identifier: UUID = UUID()){
        self.firstName = firstName
        self.lastName = lastName
        self.identifier = identifier
    }
    
    init?(dictionary:[String: Any]){
        guard let firstName = dictionary[keys.kFirstName] as? String,
        let lastName = dictionary[keys.kLastName] as? String,
        let identifier = dictionary[keys.kIdentifier] as? UUID
            else { return nil }
        
        self.firstName = firstName
        self.lastName = lastName
        self.identifier = identifier
    }
    
    var dictionaryRepresentation: [String: Any]{
        return [keys.kFirstName: self.firstName, keys.kLastName: self.lastName, keys.kLastName: self.identifier]
    }
}
