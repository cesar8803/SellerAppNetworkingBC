//
//  OptionGroup.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/8/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class OptionGroup: Mappable{
    var id: Int?
    var promoOptions: [PromoOptions]?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        id <- map["id"]
        promoOptions <- map["promoOptions"]
    }
}

