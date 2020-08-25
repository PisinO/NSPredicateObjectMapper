//
//  POMStringProperty.swift
//  POM
//
//  Created by Ondřej Pišín on 26/06/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation
import CoreData

/// Represents a property of left hand expression
public final class POMStringProperty: POMProperty
{
    override init<Element, T>(_ prop: KeyPath<Element, T>, context: POMContext) where Element : NSManagedObject
    {
        super.init(prop, context: context)
    }
    
    //  --------------------------------------------------------------------
    //  MARK: Operators
    //  --------------------------------------------------------------------
    
    /**
     Left hand expression begins with the right hand expression

     - Parameter value: Value of right hand expression
     - Parameter caseInsensitive: Lowercase & uppercase values are treated the same
     - Parameter diacriticInsensitive: Special characters treated as the base character
     
     # Example #
     ```
     Car.where(\Car.brand).beginsWith("S").predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func beginsWith(_ value: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> POMValue
    {
        let val = POMValue(value, context: context)

        let command = createStringCommand("BEGINSWITH", caseInsensitive: caseInsensitive, diacriticInsensitive: diacriticInsensitive)
        
        context.appendRequest(request: POMOperator(command, context: context))
        context.appendRequest(request: val)
        
        return val
    }

    /**
     Left hand expression contains with the right hand expression

     - Parameter value: Value of right hand expression
     - Parameter caseInsensitive: Lowercase & uppercase values are treated the same
     - Parameter diacriticInsensitive: Special characters treated as the base character
     
     # Example #
     ```
     Car.where(\Car.brand).contains("Sko").predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func contains(_ value: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> POMValue
    {
        let val = POMValue(value, context: context)
        
        let command = createStringCommand("CONTAINS", caseInsensitive: caseInsensitive, diacriticInsensitive: diacriticInsensitive)
        
        context.appendRequest(request: POMOperator(command, context: context))
        context.appendRequest(request: val)
        
        return val
    }

    /**
     Left hand expression ends with with the right hand expression

     - Parameter value: Value of right hand expression
     - Parameter caseInsensitive: Lowercase & uppercase values are treated the same
     - Parameter diacriticInsensitive: Special characters treated as the base character
     
     # Example #
     ```
     Car.where(\Car.brand).endsWith("a").predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func endsWith(_ value: String, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> POMValue
    {
        let val = POMValue(value, context: context)
        
        let command = createStringCommand("ENDSWITH", caseInsensitive: caseInsensitive, diacriticInsensitive: diacriticInsensitive)
        
        context.appendRequest(request: POMOperator(command, context: context))
        context.appendRequest(request: val)
        
        return val
    }
    
    /**
     This is a template for a predicate that checks whether the specified property value is in the array value

     - Parameter value: Array with enumerated string values
     
     # Example #
     ```
     Car.where(\Car.brand).in(["Skoda", "BMW", "Seat"]).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `in`(_ value: [String]) -> POMValue
    {
        let val = POMValue(value, context: context)
        
        context.appendRequest(request: POMOperator("IN", context: context))
        context.appendRequest(request: val)
        
        return val
    }
    
    /**
     Left hand expression is equal to right hand expression

     - Parameter value: Value of right hand expression
     
     # Example #
     ```
     Car.where(\Car.brand).isEqualTo("Skoda").predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func isEqualTo(_ value: String) -> POMValue
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
     Car.where(\Car.brand).isNotEqualTo("Skoda").predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func isNotEqualTo(_ value: String) -> POMValue
    {
        let val = POMValue(value, context: context)
        
        context.appendRequest(request: POMOperator("!=", context: context))
        context.appendRequest(request: val)
        
        return val
    }
    //  --------------------------------------------------------------------

    private func createStringCommand(_ command: String, caseInsensitive: Bool, diacriticInsensitive: Bool) -> String
    {
        if caseInsensitive || diacriticInsensitive
        {
            return "\(command)[\(caseInsensitive ? "c" : "")\(diacriticInsensitive ? "d" : "")]"
        }
        
        return command
    }
}
