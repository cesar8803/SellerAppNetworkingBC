//
//  StoresList.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 8/23/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class StoresList: Mappable{
    public  var storeData: [StoreData]?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        storeData <- map["storeData"]
    }
}
