//
//  Ext+NSManagedObject.swift
//  POM
//
//  Created by Ondřej Pišín on 29/05/2020.
//  Copyright © 2020 Ondřej Pišín. All rights reserved.
//

import Foundation
import CoreData

extension Array where Element: POMObject
{
    func any() -> Bool
    {
        return self.count > 0
    }
    
    func lastObject<T: POMObject>(ofType _: T.Type) -> T?
    {
        return self.last(where: { $0 is T }) as? T
    }
}

extension Array
{
    func query() -> String
    {
        let sequence = compactMap { (element) -> String in
            if element is String {
                return "\"\(element)\""
            }
            
            return "\(element)"
        }.joined(separator: ",")
        
        return "{\(sequence)}"
    }
}

extension String
{
    func prettyType(replacing: [String]) -> String
    {
        var final = self
        
        for str in replacing
        {
            final = final.replacingOccurrences(of: str, with: "")
        }
        
        return final
    }
}

extension KeyPath where Root: NSManagedObject
{
    var toString: String
    {
        return NSExpression(forKeyPath: self).keyPath
    }
}
