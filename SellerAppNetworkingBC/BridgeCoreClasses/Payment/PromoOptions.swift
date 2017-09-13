//
//  PromoOptions.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 13/09/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class PromoOptions: Mappable{
    public var promoOptionData: [PromoOptionData]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        promoOptionData <- map["promoOptionData"]
    }
}
