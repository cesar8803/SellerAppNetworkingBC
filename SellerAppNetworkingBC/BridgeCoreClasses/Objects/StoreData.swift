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
    public var storeAddressList: [StoreAddressList]?
    public var storeName: String?
    
    public var storeCode: String?
    public var description: String?
    public var longDescription: String?
    public var storeType: String?
    public var id: Int?
    public var storeSubType: String?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        storeAddress <- map["storeAddress"]
        storeAddressList <- map["storeAddressList"]
        storeName <- map["storeName"]
        
        storeCode <- map["storeCode"]
        description <- map["description"]
        longDescription <- map["longDescription"]
        storeType <- map["storeType"]
        id <- map["id"]
        storeSubType <- map["storeSubType"]
    }
}
