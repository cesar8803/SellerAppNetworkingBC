//
//  ItemPaymentPlans.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/6/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class ItemPaymentPlans: Mappable{
    public var benefitData: [BenefitData]?

    required public init?(map: Map){
    }
    public func mapping(map: Map){
        benefitData <- map["benefitData"]
        //print("ItemPaymentPlans(map)", map)
    }
}
