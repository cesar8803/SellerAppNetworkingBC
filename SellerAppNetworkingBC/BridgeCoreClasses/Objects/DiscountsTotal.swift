//
//  DiscountsTotal.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/5/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

//

import Foundation
import ObjectMapper

public class DiscountsTotal: Mappable{
    public var number: String?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        if let numString = map["number"].currentValue as? Double{
            number =  String(numString )
        }else{
            number <- map["number"]
        }
    }
}
