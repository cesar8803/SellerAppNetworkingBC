//
//  discountAmountTlog.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar Morales on 14/03/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class discountAmountTlog: Mappable {
    
    public var number: Double?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        number <- map["number"]
    }
    
}
