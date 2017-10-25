//
//  oldBalance.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 25/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class oldBalance: Mappable{
    
    public var number: Double?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        
        number <- map["number"]
    }
}
