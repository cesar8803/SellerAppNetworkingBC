//
//  StoreData.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/5/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class StoreData: Mappable{
    public var storeAddress: String?
    public var storeAddressList: [Storeaddresslist]?
    public var storeName: String?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        storeAddress <- map["storeAddress"]
        storeAddressList <- map["storeAddressList"]
        storeName <- map["storeName"]
    }
}
