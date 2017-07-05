//
//  BridgeCoreResponse.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/3/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class BridgeCoreResponse: Mappable{
    public var ack: Int?
    public var message: String?
    public var operationResult: OperationResult?
    public var connectionId:String?
    public var representation: RepresentationWD?
    public var actualActivity: String?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        ack <- map["ack"]
        message <- map["message"]
        operationResult <- map["operationResult"]
        connectionId <- map["connectionId"]
        representation <- map["representation"]
        actualActivity <- map["actualActivity"]
    }
}
