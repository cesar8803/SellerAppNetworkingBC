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
    
    public var benefitsData: [BenefitsData]?
    public var number: Int?
    public var benefitStatements : String?
    
    //public var promotionsData: [PromotionsData]?
    //public var promotionsData2: PromotionsData?
    
    //public var number: Int?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
       // debugPrint("++++ benifitData..:\(map["benefitsData"].currentValue)")
        
        /*
        switch map["promotionsData"].currentValue{
        case is [String:Any]:
            debugPrint("is a Dictionary...")
            
            self.promotionsData = [PromotionsData]()
            var itm:PromotionsData? = nil
            itm <- map["promoOptionData"]
            if let i = itm{
                self.promotionsData?.append(i)
            }
            
        case is [[String:Any]]:
            debugPrint("is an Array WTF!")
            promotionsData <- map["promotionsData"]
        case is NSNull:
            debugPrint("is null :(")
        default:
            debugPrint(map["promotionsData"].currentValue.debugDescription)
        }
         */
       
        benefitsData <- map["benefitsData"]
        number <- map["number"]
        
    }
}
