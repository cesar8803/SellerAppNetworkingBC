//
//  AdditionalData.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 27/07/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class AdditionalData: Mappable{
    public var additionalDataListField: [AdditionalDataListField]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        additionalDataListField <- map["additionalDataListField"]
    }
}
