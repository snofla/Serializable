//
//  Test2+CoreDataProperties.swift
//  Serializable
//
//  Created by Alfons Hoogervorst on 04/05/2019.
//  Copyright © 2019 Alfons Hoogervorst. All rights reserved.
//
//

import Foundation
import CoreData


extension Test2 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Test2> {
        return NSFetchRequest<Test2>(entityName: "Test2")
    }

    @NSManaged public var number: Float
    @NSManaged public var date: NSDate?

}
