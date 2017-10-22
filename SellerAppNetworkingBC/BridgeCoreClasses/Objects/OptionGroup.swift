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
    public var id: Int?
    public var promoOptions: [PromoOptions]?
    public var benefitStatements : String?
    
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        id <- map["id"]
        promoOptions <- map["promoOptions"]
       
    }
}

