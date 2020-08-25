//
//  POMArrayProperty.swift
//  POM
//
//  Created by Ondřej Pišín on 29/06/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation
import CoreData

public protocol POMArrayPropertyProtocol: class
{
    associatedtype ArrayElementType
    
    func elementAt(_ index: Int, equalsTo: ArrayElementType) -> POMValue
}

public protocol POMStringArrayPropertyProtocol: class
{
    associatedtype StringArrayElementType
    
    func elementAt(_ index: Int, equalsTo: StringArrayElementType) -> POMValue
}

/// Represents a property of left hand expression
public final class POMArrayProperty<T>: POMProperty, POMArrayPropertyProtocol, POMStringArrayPropertyProtocol
{
    public typealias ArrayElementType = T
    public typealias StringArrayElementType = T
    
    override init<Element, T>(_ prop: KeyPath<Element, T>, context: POMContext) where Element : NSManagedObject
    {
        super.init(prop, context: context)
    }
    
    //  --------------------------------------------------------------------
    //  MARK: Operators
    //  --------------------------------------------------------------------
    
    /**
     Left hand expression is equal to right hand expression

     - Parameter index: Index of element in array
     - Parameter equalsTo: Value of right hand expression
     
     # Example #
     ```
     Car.where(\Car.accessories).elementAt(0, equalsTo: "ABS").predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func elementAt(_ index: Int, equalsTo: T) -> POMValue
    {
        let val = POMValue(equalsTo, context: context)
        
        context.appendRequest(request: POMOperator("[\(index)] ==", context: context, descriptor: POMObjectRightSpaceDescriptor()))
        context.appendRequest(request: val)
        
        return val
    }

    /**
     Left hand expression is equal to right hand expression

     - Parameter equalsTo: Value of right hand expression
     
     # Example #
     ```
     Car.where(\Car.accessories).first(equalsTo: "ABS").predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func first(equalsTo: T) -> POMValue
    {
        let val = POMValue(equalsTo, context: context)
        
        // TODO: Add descriptor to POMObject
        context.appendRequest(request: POMOperator("[FIRST] ==", context: context, descriptor: POMObjectRightSpaceDescriptor()))
        context.appendRequest(request: val)
        
        return val
    }
    
    /**
     Left hand expression is equal to right hand expression

     - Parameter equalsTo: Value of right hand expression
     
     # Example #
     ```
     Car.where(\Car.accessories).last(equalsTo: "ABS").predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func last(equalsTo: T) -> POMValue
    {
        let val = POMValue(equalsTo, context: context)
        
        // TODO: Add descriptor to POMObject
        context.appendRequest(request: POMOperator("[LAST] ==", context: context, descriptor: POMObjectRightSpaceDescriptor()))
        context.appendRequest(request: val)
        
        return val
    }
    
    /**
     Array count is equal to right hand expression

     - Parameter equalsTo: Value of right hand expression
     
     # Example #
     ```
     Car.where(\Car.accessories).size(equalsTo: 1).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func size(equalsTo: Int) -> POMValue
    {
        let val = POMValue(equalsTo, context: context)
        
        // TODO: Add descriptor to POMObject
        context.appendRequest(request: POMOperator("[SIZE] ==", context: context, descriptor: POMObjectRightSpaceDescriptor()))
        context.appendRequest(request: val)
        
        return val
    }
    //  --------------------------------------------------------------------
}
