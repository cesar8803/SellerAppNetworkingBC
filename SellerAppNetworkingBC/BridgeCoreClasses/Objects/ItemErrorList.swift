//
//  ItemErrorList.swift
//  SellerAppNetworkingBC
//
//  Created by Alejandro Hernandez on 10/08/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class ItemErrorList: Mappable{
    
    public var itemErrorData: [ItemErrorData]?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        
        var data: ItemErrorData? = nil
        data <- map["itemErrorData"]
        
        if data != nil {
            itemErrorData = [data!]
            return
        }
        
        itemErrorData <- map["itemErrorData"]
        
    }
    
}
