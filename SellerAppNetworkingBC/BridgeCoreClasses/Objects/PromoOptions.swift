//
//  PromoOptions.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/8/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class PromoOptions: Mappable{
    public var promoOptionData: PromoOptionData?
    public var promoOptionDataArray: [PromoOptionData]?

    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        //promoOptionData <- map["promoOptionData"]
        
        if let _ = map["promoOptionData"].currentValue as? PromoOptionData{
        
            promoOptionData <- map["promoOptionData"]
        }else{
        
            promoOptionDataArray <- map["promoOptionData"]
        }
    }
}

