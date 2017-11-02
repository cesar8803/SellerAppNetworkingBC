//
//  FieldRequestData.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 27/07/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class FieldRequestData: Mappable{
    public var field: String?
    public var message: String?
    public var additionalInformation: [AdditionalInformation]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        field <- map["field"]
        message <- map["message"]
        additionalInformation <- map["additionalInformation"]
    }
}
