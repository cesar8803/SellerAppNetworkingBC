//
//  PromotionsData.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 13/09/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class PromotionsData: Mappable{
    public var promotionData: [PromotionData]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        promotionData <- map["promotionData"]
    }
}
