//
//  proratedDiscountsTotal.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar Morales on 14/03/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class proratedDiscountsTotal: Mappable {
    
    public var proratedDiscountTotal: proratedDiscountTotal?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        proratedDiscountTotal <- map["proratedDiscountTotal"]
    }
    
}
