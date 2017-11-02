//
//  walletData.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 25/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class walletData: Mappable{
    
    public var oldBalance: oldBalance?
    public var paymentAmount: paymentAmount?
    public var benefitedAmount: benefitedAmount?
    public var newBalance: newBalance?
    public var walletAccount: String?
    public var vale: Bool?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        
        oldBalance <- map["oldBalance"]
        paymentAmount <- map["paymentAmount"]
        benefitedAmount <- map["benefitedAmount"]
        newBalance <- map["newBalance"]
        walletAccount <- map["walletAccount"]
        vale <- map["vale"]
    }
}
