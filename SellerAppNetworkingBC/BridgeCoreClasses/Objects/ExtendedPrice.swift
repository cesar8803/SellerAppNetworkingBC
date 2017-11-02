 //
//  ExtendedPrice.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/6/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class ExtendedPrice: Mappable{
    public var number: String?

    required public init?(map: Map){
    }
    public func mapping(map: Map){
        
        switch map["number"].currentValue {
        case (let v as String):
            number = v
        case (let v as Float):
            number = String(v)
        default:
            debugPrint("You should add another kind of data")
        }        
    }
}
