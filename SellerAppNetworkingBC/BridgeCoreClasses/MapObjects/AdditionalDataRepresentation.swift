//
//  AdditionalDataRepresentation.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar Morales on 1/7/19.
//  Copyright © 2019 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

class AdditionalDataRepresentation: Mappable {
    var exceptionIndex : Int?
    var fieldRequests : [FieldRequests]?
    var aditionalParameters : [String]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map){
        exceptionIndex <- map["exceptionIndex"]
        fieldRequests <- map["fieldRequests"]
        aditionalParameters <- map["aditionalParameters"]
    }
}
