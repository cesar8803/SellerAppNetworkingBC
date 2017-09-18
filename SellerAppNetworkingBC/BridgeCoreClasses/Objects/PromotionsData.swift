//
//  PromotionsData.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/8/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class PromotionsData: Mappable{
    public var promotionData: PromotionData?
    
    
    required public  init?(map: Map){
    }
    
    public func mapping(map: Map){
        promotionData <- map["promotionData"]
    }
}
