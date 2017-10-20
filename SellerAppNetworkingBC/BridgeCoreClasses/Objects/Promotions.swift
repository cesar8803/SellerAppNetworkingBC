//
//  Discount.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 04/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Promotions: Mappable{
    public var benefitData: [BenefitData]?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        
        if let _ = map["benefitData"].currentValue as? [String:Any]{
            benefitData = [BenefitData]()
            var itm:BenefitData? = nil
            itm <- map["benefitData"]
            if let i = itm{
                benefitData?.append(i)
            }
        }else{
            benefitData <- map["benefitData"]
        }
        
    }
}
