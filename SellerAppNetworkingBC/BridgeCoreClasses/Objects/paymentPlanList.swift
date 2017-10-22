//
//  paymentPlanList.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 17/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class paymentPlanList: Mappable{
    public var string: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        string <- map["string"]
    }
}
