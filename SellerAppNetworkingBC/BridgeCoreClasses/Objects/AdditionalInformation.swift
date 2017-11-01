//
//  AdditionalInformation.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 27/07/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class AdditionalInformation: Mappable{
    public var dataType: String?
    /*********************************/
    public var labelTitle: String?
    public var indexRequired: String?
    public var paymentAmount: String?
    public var activeDevice: String?
    public var storeCode: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        dataType <- map["dataType"]
        /*********************************/
        labelTitle <- map["labelTitle"]
        indexRequired <- map["indexRequired"]
        storeCode <- map["storeCode"]
        activeDevice <- map["activeDevice"]
        if let payment = map["paymentAmount"].currentValue as? Double
        {
            paymentAmount = String(payment)
        }else{
            paymentAmount <- map["paymentAmount"]
        }
        
    }
}
