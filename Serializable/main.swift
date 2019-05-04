//
//  main.swift
//  Serializable
//
//  Created by Alfons Hoogervorst on 04/05/2019.
//  Copyright © 2019 Alfons Hoogervorst. All rights reserved.
//

import Foundation

/// Test: Make NSDate output something when serializing.
extension NSDate: ESerializable {
    
    var serializable: Any {
        return "Serializable"
    }
}



let coreData = CoreDataInitializer()

let test1: Test1 = try coreData.managedObjectContext.fetch(Test1.fetchRequest()).first ?? Test1(context: coreData.managedObjectContext)
let test2: Test2! = try coreData.managedObjectContext.fetch(Test2.fetchRequest()).first ?? Test2(context: coreData.managedObjectContext)

test1.date = Date() as NSDate
test1.number = 1

test2.date = Date() as NSDate
test2.number = Float.pi

coreData.save()

// check if Test1 serializes
let test1Dict = ["one": test1].serializable
print("\(String(describing: test1Dict))")

// check if Test2 entity serializes
let test2Dict = ["two": test2].serializable
print("\(String(describing: test2Dict))")

// check if nested Dictionary<String, Any> with serializable NSDates serializes
let test3Dict = (["one": NSDate(), "two": ["one": 3.4, "two": ["three": "Hello", "four": NSDate()] as [String: Any]] as [String: Any]] as [String : Any]).serializable

print("\(String(describing: test3Dict))")

print("Done")

