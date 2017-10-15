//
//  PaymentWithoutRefinance.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 10/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class PaymentWithoutRefinance: Mappable{
    public var number: Float?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        switch map["number"].currentValue {
        case (let v as Float):
            number = v
        case (let v as String):
            number = Float(v)
        default:
            debugPrint("You should add another kind of data")
        }
    }
}
