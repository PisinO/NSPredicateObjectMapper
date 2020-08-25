//
//  POMValue.swift
//  POM
//
//  Created by Ondřej Pišín on 29/05/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation
import CoreData

/// Represents a value of right hand expression
public final class POMValue: POMObject
{
    private let val: Any
    internal let type: String
    
    init<T>(_ value: T, context: POMContext)
    {
        self.val = value
        self.type = String(describing: T.self)
        
        super.init(context: context)
    }
    
    override func value() -> String
    {
        switch val {
            case let value as Array<Any>:
                return descriptor.describe(value: value.query())
            case let value as Int:
                return descriptor.describe(value: "\(String(describing: value))")
            default:
                return descriptor.describe(value: "'\(String(describing: val))'")
        }
    }
}

public extension POMValue
{
    //  --------------------------------------------------------------------
    //  MARK: Query operators
    //  --------------------------------------------------------------------
    
    /**
     Connects one chain request with a new one

     # Example #
     ```
     Car.where(\Car.brand).beginsWith("S").and.where(\Car.brand).endsWith("a").predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    var and: POMTable {
        let `operator` = POMOperator("AND", context: context)
        context.appendRequest(request: `operator`)

        return POMTable(context: context)
    }
    
    /**
     Connects one chain request with a new one

     # Example #
     ```
     Car.where(\Car.brand).beginsWith("S").or.where(\Car.brand).endsWith("a").predicate()
     ```
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    var or: POMTable {
        let `operator` = POMOperator("OR", context: context)
        context.appendRequest(request: `operator`)

        return POMTable(context: context)
    }
    //  --------------------------------------------------------------------
    
    
    
    //  --------------------------------------------------------------------
    //  MARK: Execute
    //  --------------------------------------------------------------------
    
    /**
     Execution of chain request

     # Example #
     ```
     Car.where(\Car.brand).beginsWith("S").predicate()
     ```
     
     - Returns: `NSPredicate` that can be assigned to a fetch request, `fetchRequest.predicate = chainCommands.predicate()`
     
     - Note: For quick check of chain request, this function can be also called with validation see `predicateWithValidation()`
     
     # Reference #
     [predicateWithValidation()](predicateWithValidation())
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    func predicate() -> NSPredicate
    {
        return NSPredicate(format: context.description);
    }
    
    /**
     Execution of chain request with integrity validation check

     # Example #
     ```
     Car.where(\Car.brand).beginsWith("S").predicate()
     ```
     
     - Returns: `NSPredicate` that can be assigned to a fetch request, `fetchRequest.predicate = chainCommands.predicate()`
     
     - Throws: `POMValidationError` with error detail
     
     # Reference #
     [POMValidationError.swift](POMValidationError.swift)
     
     - Remark:
     Implemented by using deferred execution. The immediate return value is an object that stores all the information that is required to perform the action. The query represented by this method is not executed until the final object is executed by calling `.predicate()`
     */
    func predicateWithValidation() throws -> NSPredicate
    {
        try context.validate()
        
        return NSPredicate(format: context.description);
    }
    //  --------------------------------------------------------------------
}
