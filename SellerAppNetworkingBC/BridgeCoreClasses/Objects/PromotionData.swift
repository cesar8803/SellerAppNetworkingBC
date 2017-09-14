//
//  PromotionData.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/8/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class PromotionData: Mappable{
    public var benefitsData: [BenefitData]?
    public var promoId: String?
    
    required public  init?(map: Map){
    }
    
    public func mapping(map: Map){
        benefitsData <- map["benefitsData"]
        promoId <- map["promoId"]
    }
}
