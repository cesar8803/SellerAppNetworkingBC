//
//  warrantyList.swift
//  SellerAppNetworkingBC
//
//  Created by nataly on 02/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Warrantylist: Mappable{
    public var warrantyData: [Warrantydata]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        warrantyData <- map["warrantyData"]
    }
}
