 //
//  EntryMethod.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/6/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class EntryMethod: Mappable{
    public var method: String?

    required public init?(map: Map){
    }

    public func mapping(map: Map){
        method <- map["method"]
    }
}
