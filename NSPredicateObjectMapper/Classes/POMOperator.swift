//
//  POMOperator.swift
//  POM
//
//  Created by Ondřej Pišín on 29/05/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation

/// Represents an operation between left hand expression and right hand expression
final class POMOperator: POMObject
{
    private let val: String
    
    init(_ value: String, context: POMContext, descriptor: POMObjectDescriptor = POMObjectTwoSpacesDescriptor())
    {
        self.val = value
        
        super.init(context: context, descriptor: descriptor)
    }
    
    override func value() -> String
    {
        return descriptor.describe(value: val)
    }
}
