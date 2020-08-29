//
//  POMObjectDescriptor.swift
//  POM
//
//  Created by Ondřej Pišín on 29/06/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation

protocol POMObjectDescriptorProtocol
{
    associatedtype T
    
    func describe<T>(value: T) -> String
}

class POMObjectDescriptor: POMObjectDescriptorProtocol
{
    typealias T = String
    
    func describe<T>(value: T) -> String {
        return "\(value)"
    }
}

class POMObjectTwoSpacesDescriptor: POMObjectDescriptor
{
    override func describe<T>(value: T) -> String
    {
        return " \(value) "
    }
}

class POMObjectRightSpaceDescriptor: POMObjectDescriptor
{
    override func describe<T>(value: T) -> String
    {
        return "\(value) "
    }
}

//class POMObjectLeftSpaceDescriptor: POMObjectDescriptor
//{
//    override func describe(value: String) -> String
//    {
//        return " \(value)"
//    }
//}
