//
//  OriginalExtendedPrice.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/6/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class OriginalExtendedPrice: Mappable{
    public var  number: String?

    required public init?(map: Map){
    }
    public func mapping(map: Map){
        switch map["number"].currentValue {
        case (let v as String):
            number = v
        case (let v as Int):
            number = String(v)
        case (let v as Double):
            number = String(v)
        default:
            debugPrint("You should add another kind of data")
        }
    }
}
