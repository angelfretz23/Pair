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
    var groupName: String?
    let identifier: UUID // Just in case there is a person with the same name
    
    struct keys{
        static let kFullName = "fullName"
        static let kGroupName = "groupName"
        static let kIdentifier = "identifier"
    }
    
    init(fullName: String, groupName: String? =  nil ,identifier: UUID = UUID()){
        self.fullName = fullName
        self.groupName = groupName
        self.identifier = identifier
    }
    
    init?(dictionary:[String: Any]){
        guard let fullName = dictionary[keys.kFullName] as? String,
            let groupName = dictionary[keys.kGroupName] as? String,
            let identifier = dictionary[keys.kIdentifier] as? UUID
            else { return nil }
        
        self.fullName = fullName
        self.groupName = groupName
        self.identifier = identifier
    }
    
    var dictionaryRepresentation: [String: Any]{
        return [keys.kFullName: self.fullName, keys.kGroupName: self.groupName, keys.kIdentifier: self.identifier]
    }
}

func ==(left: Person, right: Person) -> Bool{
    return left.identifier == right.identifier
}
