//
//  Dictionary+Serializable.swift
//  SerializableDictionary
//
//  Created by Alfons Hoogervorst on 04/05/2019.
//  Copyright © 2019 Alfons Hoogervorst. All rights reserved.
//

import Foundation
import CoreData


/// Objects that need to be serialized in a special way implement
/// this protocol
protocol ESerializable {
    var serializable: Any { get }
}


/// Default implementation on NSObject classes require a serializable
/// implementation
extension ESerializable where Self: NSObject {
}


/// Dictionary extension that handles serialization by checking values
/// for implementing ESerializable, or values being dictionaries that
/// are inspected recursively for ESerializable content.
extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any {
    
    /// Creates a serializable dictionary, by checking recursively
    /// whether values are serializable
    var serializable: [String: Any]? {
        get {
            let result = self.map { (k, v) -> (String, Any) in
                if let object = v as? ESerializable {
                    // if encountered type is serializable
                    return (k as! String, object.serializable)
                } else if let object = v as? Dictionary<Key, Value> {
                    // if encountered type is a dictionary, serialize
                    return (k as! String, object.serializable ?? NSNull())
                } else {
                    // otherwise return the value
                    return (k as! String, v)
                }
            }
            return [String: Any](uniqueKeysWithValues: result)
        }
    }
    
}
