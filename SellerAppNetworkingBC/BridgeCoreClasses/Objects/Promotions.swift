//
//  Discount.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 04/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Promotions: Mappable{
    public var benefitData: [BenefitData]?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        benefitData <- map["benefitData"]
    }
}
