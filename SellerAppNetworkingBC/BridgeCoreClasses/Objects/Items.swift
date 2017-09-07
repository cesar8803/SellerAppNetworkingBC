//
//  Items.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/6/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Items: Mappable{
    public var itemTicketLiverpoolData: [ItemTicketLiverpoolData]?

    required public init?(map: Map){
    }
    public func mapping(map: Map){
        itemTicketLiverpoolData <- map["itemTicketLiverpoolData"]
    }
}
