//
//  POMContext.swift
//  POM
//
//  Created by Ondřej Pišín on 29/05/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation
import CoreData

internal extension POMContext
{
    func appendRequest<T>(request: T) where T: POMObject
    {
        unowned let weakRef = request
        requestVector.append(weakRef)
    }
    
    func validate() throws
    {
        var requestVector = [POMObject]()
        
        for request in self.requestVector
        {
            try POMValidator.validate(requestVector: requestVector, request: request)
            requestVector.append(request)
        }
    }
}

/// Stores all the information that is required to perform the action
public final class POMContext
{
    /// All POMObjects are referenced only by user in chain operation. They are alive as long as context, so it has to keep only weak references of POMObjects, to keep retain cycle on 1:
    /// User creates predicate -> strong POMProperty -> strong POMContext -> [weak POMProperty]
    fileprivate var requestVector = [POMObject]()
    
    internal var description: String
    {
        return requestVector.map({ $0.value() }).joined()
    }
    
    internal var parameters: [Any] {
        var values = [Any]()
        for value in requestVector.compactMap({ $0 as? POMValue }).map({ $0.valueObject }) {
            switch value {
                case let value as Int:
                    values.append(NSNumber(value: value))
                case let value as Float:
                    values.append(NSNumber(value: value))
                case let value as Double:
                    values.append(NSNumber(value: value))
                case let value as Bool:
                    values.append(NSNumber(value: value))
                default:
                    values.append(value)
            }
        }
        
        return values
    }
    
    internal init() { }
}
