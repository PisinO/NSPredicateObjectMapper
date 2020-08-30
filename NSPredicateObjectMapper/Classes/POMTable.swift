//
//  POMTable.swift
//  POM
//
//  Created by Ondřej Pišín on 21/06/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation
import CoreData

/// Represents one entity in Core Data xcdatamodeld
public class POMTable: POMObject, POMTableProtocol
{
    //  --------------------------------------------------------------------
    //  MARK: Numeric (Int, Float, Decimal, Date)
    //  --------------------------------------------------------------------
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.id).isEqualTo(1).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject, T>(_ prop: KeyPath<Element, T>) -> POMNumericProperty<T>
    {
        return Self.numeric(prop, context)
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: Object (Transformable, Undefined)
    //  --------------------------------------------------------------------
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.id).isEqualTo(1).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, NSObject>) -> POMGenericProperty<NSObject>
    {
        return Self.basic(prop, context)
    }
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.id).isEqualTo(1).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, NSObject?>) -> POMGenericProperty<NSObject?>
    {
        return Self.basic(prop, context)
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: Identifier (UUID, URI)
    //  --------------------------------------------------------------------
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.id).isEqualTo(1).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, UUID>) -> POMGenericProperty<UUID>
    {
        return Self.basic(prop, context)
    }
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.id).isEqualTo(1).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, UUID?>) -> POMGenericProperty<UUID?>
    {
        return Self.basic(prop, context)
    }
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.id).isEqualTo(1).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, URL>) -> POMGenericProperty<URL>
    {
        return Self.basic(prop, context)
    }
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.id).isEqualTo(1).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, URL?>) -> POMGenericProperty<URL?>
    {
        return Self.basic(prop, context)
    }
    //  --------------------------------------------------------------------
    

    
    //  --------------------------------------------------------------------
    //  MARK: String
    //  --------------------------------------------------------------------
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.id).isEqualTo(1).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, String>) -> POMStringProperty
    {
        return Self.string(prop, context)
    }
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.id).isEqualTo(1).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, String?>) -> POMStringProperty
    {
        return Self.string(prop, context)
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: Bool
    //  --------------------------------------------------------------------
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.isAvailable).isEqualTo(true).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, Bool>) -> POMGenericProperty<Bool>
    {
        return Self.basic(prop, context)
    }
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.isAvailable).isEqualTo(true).predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, Bool?>) -> POMGenericProperty<Bool?>
    {
        return Self.basic(prop, context)
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: Array
    //  --------------------------------------------------------------------
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.accessories).elementAt(0, equalsTo: "ABS").predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject, T>(_ prop: KeyPath<Element, [T]>) -> POMArrayProperty<T>
    {
        return Self.array(prop, context)
    }
    
    /**
     Projects selected keypath of `NSManagedObject` property into a predicate request chain
     
     - Parameter prop: KeyPath to `NSManagedObject` property
     
     # Example #
     ```
     Car.where(\Car.accessories).elementAt(0, equalsTo: "ABS").predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    public func `where`<Element: NSManagedObject, T>(_ prop: KeyPath<Element, [T]?>) -> POMArrayProperty<T>
    {
        return Self.array(prop, context)
    }
    //  --------------------------------------------------------------------
}
