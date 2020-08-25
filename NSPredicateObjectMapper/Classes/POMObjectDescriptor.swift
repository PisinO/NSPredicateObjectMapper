//
//  POMObjectDescriptor.swift
//  POM
//
//  Created by Ondřej Pišín on 29/06/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation

class POMObjectDescriptorBase
{
    func describe<T>(value: T) -> String
    {
        fatalError()
    }
}

class POMObjectDescriptor: POMObjectDescriptorBase
{
    func describe(value: String) -> String
    {
        return "\(value)"
    }
}

class POMObjectTwoSpacesDescriptor: POMObjectDescriptor
{
    override func describe(value: String) -> String
    {
        return " \(value) "
    }
}

class POMObjectRightSpaceDescriptor: POMObjectDescriptor
{
    override func describe(value: String) -> String
    {
        return "\(value) "
    }
}

class POMObjectLeftSpaceDescriptor: POMObjectDescriptor
{
    override func describe(value: String) -> String
    {
        return " \(value)"
    }
}
