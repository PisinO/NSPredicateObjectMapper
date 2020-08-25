//
//  POMGenericProperty.swift
//  POM
//
//  Created by Ondřej Pišín on 26/06/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation
import CoreData

/// Represents a property of left hand expression
public class POMGenericProperty<T>: POMProperty
{
    override init<Element, T>(_ prop: KeyPath<Element, T>, context: POMContext) where Element : NSManagedObject
    {
        super.init(prop, context: context)
    }
    
    //  --------------------------------------------------------------------
    //  MARK: Operators
    //  --------------------------------------------------------------------
    
    /**
     Left hand expression is equal to right hand expression

     - Parameter value: Value of right hand expression
     
     # Example #
     ```
     Car.where(\Car.id).isEqualTo(1).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func isEqualTo<T>(_ value: T) -> POMValue
    {
        let val = POMValue(value, context: context)
        
        context.appendRequest(request: POMOperator("==", context: context))
        context.appendRequest(request: val)
        
        return val
    }
    
    /**
     Left hand expression is not equal to right hand expression

     - Parameter value: Value of right hand expression
     
     # Example #
     ```
     Car.where(\Car.id).isNotEqualTo(1).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func isNotEqualTo<T>(_ value: T) -> POMValue
    {
        let val = POMValue(value, context: context)
        
        context.appendRequest(request: POMOperator("!=", context: context))
        context.appendRequest(request: val)
        
        return val
    }
    //  --------------------------------------------------------------------
}
