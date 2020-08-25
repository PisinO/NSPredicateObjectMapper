//
//  POMProperty.swift
//  POM
//
//  Created by Ondřej Pišín on 29/05/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation
import CoreData

/// Represents a property of left hand expression
public class POMProperty: POMObject
{
    private let propertyKP: AnyKeyPath
    private let propertyName: String
    internal let type: String
    
    init<Element, T>(_ prop: KeyPath<Element, T>, context: POMContext) where Element : NSManagedObject
    {
        self.propertyKP = prop
        self.propertyName = prop.toString
        self.type = String(describing: T.self)
        
        super.init(context: context)
    }
    
    override func value() -> String
    {
        return descriptor.describe(value: propertyName)
    }
}
