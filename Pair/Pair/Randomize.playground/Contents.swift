//: Playground - noun: a place where people can play

import UIKit

var persons = ["Angel C", "Justin C", "Austin V", "Chandi A", "Joseph H"]

//func randomize() -> [String: (String, String?)]{
//    var tempDictionary: [String :(String, String?)] = [:]
//    
//    let threshold: Double = ceil(Double(persons.count)/2)
//    
//    for x in 0...Int(threshold){
//        let pairOne = persons.remove(at: Int(arc4random()) % (persons.count))
//        let pairTwo: String? = persons.remove(at: Int(arc4random()) % (persons.count))
//        
//        tempDictionary[String(x)] = (pairOne, pairTwo)
//    }
//    return tempDictionary
//}

extension Array{
    mutating func shuffle(){
        for _ in 0..<10{ sort { (_,_) in arc4random() < arc4random() } }
    }
}

persons.shuffle()