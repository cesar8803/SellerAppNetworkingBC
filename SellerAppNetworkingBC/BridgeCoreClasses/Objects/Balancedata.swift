//
//  Balancedata.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 10/08/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Balancedata: Mappable{
    public var account: Int?
    public var walletBalance: Walletbalance?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        account <- map["account"]
        walletBalance <- map["walletBalance"]
    }
}
