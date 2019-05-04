//
//  Test1+CoreDataProperties.swift
//  Serializable
//
//  Created by Alfons Hoogervorst on 04/05/2019.
//  Copyright © 2019 Alfons Hoogervorst. All rights reserved.
//
//

import Foundation
import CoreData


extension Test1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Test1> {
        return NSFetchRequest<Test1>(entityName: "Test1")
    }

    @NSManaged public var number: Int32
    @NSManaged public var date: NSDate?

}
