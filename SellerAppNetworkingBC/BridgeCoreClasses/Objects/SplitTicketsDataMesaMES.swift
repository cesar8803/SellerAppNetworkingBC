//
//  SplitTicketsDataMesaMES.swift
//  SellerAppNetworkingBC
//
//  Created by Oscar Morales on 04/06/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class SplitTicketsDataMesaMES: Mappable {
    
    public var ticketDataLiverpool: ticketDataLiverpool?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        ticketDataLiverpool <- map["ticketDataLiverpool"]
    }
}
