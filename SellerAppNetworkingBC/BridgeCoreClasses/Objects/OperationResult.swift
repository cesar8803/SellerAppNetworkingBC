//
//  OperationResult.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/3/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class OperationResult: Mappable{
    public var exchangeCurrencyListData: [ExchangeCurrencyListData]?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        exchangeCurrencyListData <- map["exchangeCurrencyListData"]
    }
}
