//
//  POMTableProtocol.swift
//  POM
//
//  Created by Ondřej Pišín on 26/06/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation
import CoreData

public protocol POMTableProtocol {}

extension NSManagedObject: POMTableProtocol {}

public extension POMTableProtocol
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
    static func `where`<Element: NSManagedObject, T>(_ prop: KeyPath<Element, T>) -> POMNumericProperty<T>
    {
        return self.numeric(prop)
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
    static func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, NSObject>) -> POMGenericProperty<NSObject>
    {
        return self.basic(prop)
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
    static func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, NSObject?>) -> POMGenericProperty<NSObject?>
    {
        return self.basic(prop)
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
    static func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, UUID>) -> POMGenericProperty<UUID>
    {
        return self.basic(prop)
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
    static func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, UUID?>) -> POMGenericProperty<UUID?>
    {
        return self.basic(prop)
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
    static func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, URL>) -> POMGenericProperty<URL>
    {
        return self.basic(prop)
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
    static func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, URL?>) -> POMGenericProperty<URL?>
    {
        return self.basic(prop)
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
    static func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, String>) -> POMStringProperty
    {
        return self.string(prop)
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
    static func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, String?>) -> POMStringProperty
    {
        return self.string(prop)
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
    static func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, Bool>) -> POMGenericProperty<Bool>
    {
        return self.basic(prop)
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
    static func `where`<Element: NSManagedObject>(_ prop: KeyPath<Element, Bool?>) -> POMGenericProperty<Bool?>
    {
        return self.basic(prop)
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
    static func `where`<Element: NSManagedObject, T>(_ prop: KeyPath<Element, [T]>) -> POMArrayProperty<T>
    {
        return self.array(prop)
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
    static func `where`<Element: NSManagedObject, T>(_ prop: KeyPath<Element, [T]?>) -> POMArrayProperty<T>
    {
        return self.array(prop)
    }
    //  --------------------------------------------------------------------
    
    
    
    // Factory
    static internal func string<Element: NSManagedObject, T>(_ prop: KeyPath<Element, T>, _ context: POMContext = POMContext()) -> POMStringProperty
    {
        let property = POMStringProperty(prop, context: context)
        
        context.appendRequest(request: property)
        
        return property
    }
    
    static internal func numeric<Element: NSManagedObject, T>(_ prop: KeyPath<Element, T>, _ context: POMContext = POMContext()) -> POMNumericProperty<T>
    {
        let property = POMNumericProperty<T>(prop, context: context)
        
        context.appendRequest(request: property)
        
        return property
    }
    
    static internal func basic<Element: NSManagedObject, T>(_ prop: KeyPath<Element, T>, _ context: POMContext = POMContext()) -> POMGenericProperty<T>
    {
        let property = POMGenericProperty<T>(prop, context: context)
        
        context.appendRequest(request: property)
        
        return property
    }

    static internal func array<Element: NSManagedObject, T>(_ prop: KeyPath<Element, [T]?>, _ context: POMContext = POMContext()) -> POMArrayProperty<T>
    {
        let property = POMArrayProperty<T>(prop, context: context)

        context.appendRequest(request: property)

        return property
    }
    
    static internal func array<Element: NSManagedObject, T>(_ prop: KeyPath<Element, [T]>, _ context: POMContext = POMContext()) -> POMArrayProperty<T>
    {
        let property = POMArrayProperty<T>(prop, context: context)
        
        context.appendRequest(request: property)
        
        return property
    }
}
