//
//  NSManagedObject+Serializable.swift
//  Serializable
//
//  Created by Alfons Hoogervorst on 04/05/2019.
//  Copyright © 2019 Alfons Hoogervorst. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject: ESerializable {
    
    var serializable: Any {
        // get the attributes, create a dictionary, and serialize
        let propertyKeys = Array(self.entity.attributesByName.keys)
        let dict = self.dictionaryWithValues(forKeys: propertyKeys)
        let resultingDict = dict.serializable
        return resultingDict
    }
    
}
