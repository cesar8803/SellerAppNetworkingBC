//
//  Forcekeysdata.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar on 02/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Forcekeysdata: Mappable{
    public var tagET: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        tagET <- map["tagET"]
    }
}
