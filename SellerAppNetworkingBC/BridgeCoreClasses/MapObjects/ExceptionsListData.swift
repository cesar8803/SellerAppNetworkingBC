//
//  ExceptionsListData.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar Morales on 1/7/19.
//  Copyright © 2019 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class ExceptionsListData: Mappable {
    var additionalDataRepresentation: AdditionalDataRepresentation?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        additionalDataRepresentation <- map["additionalDataRepresentation"]
    }
}
