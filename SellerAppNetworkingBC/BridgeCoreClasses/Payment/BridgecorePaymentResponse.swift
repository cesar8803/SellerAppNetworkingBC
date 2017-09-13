//
//  BridgecorePaymentResponse.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 13/09/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class BridgecorePaymentResponse: Mappable{
    public var bridgeCoreResponse: BridgeCoreResponse?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        bridgeCoreResponse <- map["bridgeCoreResponse"]
    }
}
