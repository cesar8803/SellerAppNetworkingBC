//
//  BenefitsData.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 13/09/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class BenefitsData: Mappable{
    public var benefitData: [BenefitData]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        benefitData <- map["benefitData"]
    }
}
