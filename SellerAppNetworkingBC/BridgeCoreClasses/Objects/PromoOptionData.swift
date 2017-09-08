//
//  PromoOptionData.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/8/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class PromoOptionData: Mappable{
    public var promotionsData: [PromotionsData]?
    public var number: Int?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        promotionsData <- map["promotionsData"]
        number <- map["number"]
    }
}
