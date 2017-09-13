//
//  PromoOptionData.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 13/09/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class PromoOptionData: Mappable{
    public var promotionsData: [PromotionsData]?
    public var number: Int?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        promotionsData <- map["promotionsData"]
        number <- map["number"]
    }
}
