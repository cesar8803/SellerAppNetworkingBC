//
//  somsOrderData.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 27/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//
import Foundation
import ObjectMapper

public class somsOrderData: Mappable{
    
    public var somsAccountNumber: Int?
    public var deliveryNumber: Int?
    public var deliveryType: Int?
    public var printNoAmpara: Bool?
    public var texto1: String?
    public var texto2: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        
        somsAccountNumber <- map["somsAccountNumber"]
        deliveryNumber <- map["deliveryNumber"]
        deliveryType <- map["deliveryType"]
        printNoAmpara <- map["printNoAmpara"]
        texto1 <- map["texto1"]
        texto2 <- map["texto2"]
    }
}
