//
//  discountAmountTlog.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar Morales on 14/03/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class discountAmountTlog: Mappable {
    
    public var number: String?
    
    public required init?(map: Map){
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
