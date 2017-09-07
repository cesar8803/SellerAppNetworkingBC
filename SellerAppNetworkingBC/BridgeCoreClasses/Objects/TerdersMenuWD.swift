//
//  TerdersMenuWD.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/5/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class TendersMenuWD: Mappable{
    public var extendedProperties: [String]?
    public var options: [String]?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        extendedProperties <- map["extendedProperties"]
        options <- map["options"]
    }
}
