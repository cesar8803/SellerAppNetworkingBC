//
//  FieldRequests.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 27/07/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class FieldRequests: Mappable{
    public var fieldRequestData: [FieldRequestData]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        
        if let _ = map["fieldRequestData"].currentValue as? [String:Any]{
            fieldRequestData = [FieldRequestData]()
            var itm:FieldRequestData? = nil
            itm <- map["fieldRequestData"]
            if let i = itm{
                fieldRequestData?.append(i)
            }
        }else{
            fieldRequestData <- map["fieldRequestData"]
        }
        
        
        
        
        
        
        
        
    }
}
