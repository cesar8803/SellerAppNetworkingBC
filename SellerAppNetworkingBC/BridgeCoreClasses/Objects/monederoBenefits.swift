//
//  monederoBenefits.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 19/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class monederoBenefits: Mappable{
    
    public var discountDataLiverpool: [Discountdataliverpool]?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        discountDataLiverpool <- map["discountDataLiverpool"]
    }
}
