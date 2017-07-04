//
//  ExchangeCurrencyData.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/3/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class ExchangeCurrencyData: Mappable{
    public var valorTipoCambio: ValorTipoCambio?
    public var factor: Float?
    public var nameCurrency: String?
    public var currencySymbol: String?
    public var maxAmount: Int?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        valorTipoCambio <- map["valorTipoCambio"]
        factor <- map["factor"]
        nameCurrency <- map["nameCurrency"]
        currencySymbol <- map["currencySymbol"]
        maxAmount <- map["maxAmount"]
    }
}
