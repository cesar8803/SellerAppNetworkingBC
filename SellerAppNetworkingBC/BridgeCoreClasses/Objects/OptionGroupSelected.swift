//
//  OptionGroupSelected.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/8/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class OptionGroupSelected: Mappable{
    public var id: Int?
    public var option: Int?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        id <- map["id"]
        option <- map["option"]
    }
}
