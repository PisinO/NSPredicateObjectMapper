//
//  POMObject.swift
//  POM
//
//  Created by Ondřej Pišín on 29/05/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation

public class POMObject
{
    internal let context: POMContext
    internal let descriptor: POMObjectDescriptor
    
    init(context: POMContext, descriptor: POMObjectDescriptor = POMObjectDescriptor())
    {
        self.context = context
        self.descriptor = descriptor
    }
    
    /// Abstract
    internal func value() -> String
    {
        fatalError()
    }
}
