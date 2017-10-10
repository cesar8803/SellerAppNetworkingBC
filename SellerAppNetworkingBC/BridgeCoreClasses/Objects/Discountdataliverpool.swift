//
//  Discountdataliverpool.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 04/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Discountdataliverpool: Mappable{
    public var index: Int?
    public var promo: Int?
    public var baseAmount: Baseamount?
    public var aVoid: Int?
    public var percent: Percent?
    public var voided: Int?
    public var discount: Discount?
    public var descriptions: [String]?
    public var type: Int?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        index <- map["index"]
        promo <- map["promo"]
        baseAmount <- map["baseAmount"]
        aVoid <- map["aVoid"]
        percent <- map["percent"]
        voided <- map["voided"]
        discount <- map["discount"]
        descriptions <- map["descriptions"]
        type <- map["type"]
    }
}
