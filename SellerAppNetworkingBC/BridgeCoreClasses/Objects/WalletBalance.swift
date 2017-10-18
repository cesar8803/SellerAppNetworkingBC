//
//  walletBalance.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 10/08/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Walletbalance: Mappable{
    public var number: Float?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        if let numString = map["number"].currentValue as? Double{
            number =  String(numString )
        }else{
            number <- map["number"]
        }
    }
}
