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
    public var promoOptionData: [PromoOptionData]?
    

    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        /*
        print("PromoOptions(map)",map)
        switch map["promoOptionData"].currentValue{
        case is [String:Any]:
            debugPrint("promoOptionData is a dictionary")
            
            self.promoOptionData = [PromoOptionData]()
            var itm:PromoOptionData? = nil
            itm <- map["promoOptionData"]
            if let i = itm{
                self.promoOptionData?.append(i)
            }
            
            
        case is [[String:Any]]:
            debugPrint("promoOptionData is an Array of dictionary")
            promoOptionData <- map["promoOptionData"]
        default:
            debugPrint("promoOptionData is other type")
        }
        */
        
         promoOptionData <- map["promoOptionData"]
        
    }
}

