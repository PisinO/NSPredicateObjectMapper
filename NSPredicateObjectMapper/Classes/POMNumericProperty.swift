//
//  POMNumericProperty.swift
//  POM
//
//  Created by Ondřej Pišín on 26/06/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation
import CoreData

/// Represents a property of left hand expression
public final class POMNumericProperty<T>: POMGenericProperty<T>
{
    override init<Element, T>(_ prop: KeyPath<Element, T>, context: POMContext) where Element : NSManagedObject
    {
        super.init(prop, context: context)
    }
    
    //  --------------------------------------------------------------------
    //  MARK: Operators
    //  --------------------------------------------------------------------
    
    /**
     Left hand expression is greater than right hand expression

     - Parameter value: Value of right hand expression
     
     # Example #
     ```
     Car.where(\Car.horsepower).isGreaterThen(80).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func isGreaterThen<T>(_ value: T) -> POMValue
    {
        let val = POMValue(value, context: context)
        
        context.appendRequest(request: POMOperator(">", context: context))
        context.appendRequest(request: val)
        
        return val
    }
    
    /**
     Left hand expression is less than right hand expression

     - Parameter value: Value of right hand expression
     
     # Example #
     ```
     Car.where(\Car.horsepower).isLessThen(80).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func isLessThen<T>(_ value: T) -> POMValue
    {
        let val = POMValue(value, context: context)
        
        context.appendRequest(request: POMOperator("<", context: context))
        context.appendRequest(request: val)
        
        return val
    }
    
    /**
     Left hand expression is greater than or equal to right hand expression

     - Parameter value: Value of right hand expression
     
     # Example #
     ```
     Car.where(\Car.horsepower).isGreaterOrEqualTo(80).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func isGreaterOrEqualTo<T>(_ value: T) -> POMValue
    {
        let val = POMValue(value, context: context)
        
        context.appendRequest(request: POMOperator(">=", context: context))
        context.appendRequest(request: val)
        
        return val
    }
    
    /**
     Left hand expression is less than or equal to right hand expression

     - Parameter value: Value of right hand expression
     
     # Example #
     ```
     Car.where(\Car.horsepower).isLessOrEqualTo(80).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func isLessOrEqualTo<T>(_ value: T) -> POMValue
    {
        let val = POMValue(value, context: context)
        
        context.appendRequest(request: POMOperator("<=", context: context))
        context.appendRequest(request: val)
        
        return val
    }
    
    /**
     This is a template for a predicate that checks whether the specified property value is in the array value
     
     - Parameter value: Array with enumerated values of T
     
     # Example #
     ```
     Car.where(\Car.id).in([1, 2, 3]).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `in`(_ value: [T]) -> POMValue
    {
        let val = POMValue(value, context: context)
        
        context.appendRequest(request: POMOperator("IN", context: context))
        context.appendRequest(request: val)
        
        return val
    }
    //  --------------------------------------------------------------------
}
