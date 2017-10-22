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
        number <- map["number"]
    }
}
