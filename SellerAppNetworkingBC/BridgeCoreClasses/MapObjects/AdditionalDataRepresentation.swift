//
//  AdditionalDataRepresentation.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar Morales on 1/7/19.
//  Copyright © 2019 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class AdditionalDataRepresentation: Mappable {
    public var exceptionIndex : Int?
    public var fieldRequests : [FieldRequests]?
    public var aditionalParameters : [String]?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        exceptionIndex <- map["exceptionIndex"]
        fieldRequests <- map["fieldRequests"]
        aditionalParameters <- map["aditionalParameters"]
    }
}
