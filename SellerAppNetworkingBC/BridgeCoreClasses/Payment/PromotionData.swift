//
//  PromotionData.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 13/09/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class PromotionData: Mappable{
    public var benefitsData: [BenefitsData]?
    public var promoId: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        benefitsData <- map["benefitsData"]
        promoId <- map["promoId"]
    }
}
