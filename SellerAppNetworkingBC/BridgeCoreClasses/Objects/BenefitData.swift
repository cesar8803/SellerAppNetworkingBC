//
//  BenefitData.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 29/08/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class BenefitData: Mappable{
    public var displayMessage: String?
    public var promoId: String?
    public var tlogMessage: String?
    public var benefitType: String?
    public var printerMessage: String?
    public var value: Value?
    public var installments: String?
    public var paymentPlanId: String?
    public var bank: String?
    public var discountValue: DiscountValue?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        displayMessage <- map["displayMessage"]
        promoId <- map["promoId"]
        tlogMessage <- map["tlogMessage"]
        benefitType <- map["benefitType"]
        value <- map["value"]
        printerMessage <- map["printerMessage"]
        if let installmentsString = map["installments"].currentValue as? Double{
            installments =  String(Int(installmentsString))
        }else{
            installments <- map["installments"]
        }
        paymentPlanId <- map["paymentPlanId"]
        bank <- map["bank"]
        discountValue <- map["discountValue"]
        //print("BenefitData(map)",map)
    }
}
