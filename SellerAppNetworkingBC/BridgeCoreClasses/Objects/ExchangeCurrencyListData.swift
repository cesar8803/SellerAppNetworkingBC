//
//  ExchangeCurrencyListdata.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/3/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class ExchangeCurrencyListData: Mappable{
    public var exchangeCurrencyData: [ExchangeCurrencyData]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        exchangeCurrencyData <- map["exchangeCurrencyData"]
    }
}
