//
//  proratedDiscountTotal.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar Morales on 14/03/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class proratedDiscountTotal: Mappable {
    
    public var discountTypeTlog: String?
    public var discountAmountTlog: discountAmountTlog?
    public var description: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        discountTypeTlog <- map["discountTypeTlog"]
        discountAmountTlog <- map["discountAmountTlog"]
        description <- map["description"]
    }
    
}
