//
//  Discounts.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 04/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Discounts: Mappable{
    
    public var discountDataLiverpool: [Discountdataliverpool]?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        
        switch map["discountDataLiverpool"].currentValue{
        
        case is [String:Any]:
            
            self.discountDataLiverpool = [Discountdataliverpool]()
            var itm:Discountdataliverpool? = nil
            itm <- map["discountDataLiverpool"]
            if let i = itm{
                self.discountDataLiverpool?.append(i)
            }
            
            
        case is [[String:Any]]:
            discountDataLiverpool <- map["discountDataLiverpool"]
        default:
            debugPrint("promoOptionData is other type")
        }
    }
}
