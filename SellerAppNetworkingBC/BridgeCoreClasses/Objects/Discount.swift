//
//  Discount.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 04/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Discount: Mappable{
    public var number: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        
        switch map["number"].currentValue {
        case (let v as String):
            number = v
        case (let v as Double):
            number = String(v)
        default:
            debugPrint("You should add another kind of data")
        }
        
    }
}
