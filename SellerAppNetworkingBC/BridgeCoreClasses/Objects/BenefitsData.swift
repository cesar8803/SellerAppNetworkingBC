//
//  BenefitsData.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/8/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class BenefitsData: Mappable{
    public var benefitData: [BenefitData]?
    public var uBenefitData: BenefitData?

    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        benefitData <- map["benefitData"]
        uBenefitData <- map["benefitData"]
    }
}
