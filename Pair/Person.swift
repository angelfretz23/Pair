//
//  Person.swift
//  Pair
//
//  Created by Angel Contreras on 10/7/16.
//  Copyright © 2016 Angel Contreras. All rights reserved.
//

import Foundation

class Person: Equatable{
    let fullName: String
    let identifier: String // Just in case there is a person with the same name
    
    struct keys{
        static let kFullName = "fullName"
        static let kIdentifier = "identifier"
    }
    
    init(fullName: String, groupName: String? =  nil ,identifier: UUID = UUID()){
        self.fullName = fullName
        self.identifier = identifier.uuidString
    }
    
    init?(dictionary:[String: Any]){
        guard let fullName = dictionary[keys.kFullName] as? String,
            let identifier = dictionary[keys.kIdentifier] as? String
            else { return nil }
        
        self.fullName = fullName
        self.identifier = identifier
    }
    
    var dictionaryRepresentation: [String: Any]{
        return [keys.kFullName: self.fullName,  keys.kIdentifier: self.identifier]
    }
}

func ==(left: Person, right: Person) -> Bool{
    return left.identifier == right.identifier
}
