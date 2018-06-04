//
//  ticketDataLiverpool.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar Morales on 04/06/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class ticketDataLiverpool: Mappable {
    
    public var somsOrderData : somsOrderData?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        somsOrderData <- map["somsOrderData"]
    }
}
