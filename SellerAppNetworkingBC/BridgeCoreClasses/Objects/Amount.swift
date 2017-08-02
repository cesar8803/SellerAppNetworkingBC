//
//  Amount.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 01/08/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Amount: Mappable{
    public var number: Double?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        
        if let value = map["number"].currentValue as? String{
        
            number = Double(value)

        }else{
        
            number <- map["number"]

        }
        
    }
}
