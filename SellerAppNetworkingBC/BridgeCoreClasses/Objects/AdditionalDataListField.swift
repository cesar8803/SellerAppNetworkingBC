//
//  AdditionalDataListField.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 27/07/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class AdditionalDataListField: Mappable{
    public var position: Int?
    public var value: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        position <- map["position"]
        value <- map["value"]
    }
}
