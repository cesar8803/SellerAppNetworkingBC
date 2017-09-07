//
//  BridgeCore.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/4/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class BridgeCore: Mappable{
    public var bridgeCoreResponse: BridgeCoreResponse?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        bridgeCoreResponse <- map["bridgeCoreResponse"]
    }
}
