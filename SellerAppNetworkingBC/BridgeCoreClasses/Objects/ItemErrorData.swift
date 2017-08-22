//
//  ItemErrorData.swift
//  SellerAppNetworkingBC
//
//  Created by Alejandro Hernandez on 10/08/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class ItemErrorData: Mappable{
    
    var itemCode: Int?
    var message: String?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        itemCode <- map["itemCode"]
        message <- map["message"]
    }
    
}
