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
    public var promotionDataWar : [PromotionData]?
    
    required public  init?(map: Map){
    }
    
    public func mapping(map: Map){
        
        switch map["PromotionData"].currentValue{
        case is PromotionData:
            promotionData <- map["PromotionData"]
        case is [PromotionData]:
            promotionDataWar <- map["PromotionData"]
       default:
            debugPrint(map["promotionsData"].currentValue.debugDescription)
        }
    }
}
