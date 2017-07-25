//
//  ItemData.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/25/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class ItemData: Mappable{
    public var itemLiverpoolData: ItemLiverpoolData?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        itemLiverpoolData <- map["itemLiverpoolData"]
    }
}
