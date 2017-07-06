//
//  StoreAddressList.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/5/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

//

import Foundation
import ObjectMapper

public class StoreAddressList: Mappable{
    public var string: [String]?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        string <- map["string"]
    }
}
