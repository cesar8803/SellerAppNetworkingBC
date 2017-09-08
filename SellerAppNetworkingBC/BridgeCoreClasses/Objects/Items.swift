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
    
    public var isArray:Bool = false
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        if let _ = map["itemTicketLiverpoolData"].currentValue as? [String:Any]{
            self.itemTicketLiverpoolData = [ItemTicketLiverpoolData]()
            var itm:ItemTicketLiverpoolData? = nil
            itm <- map["itemTicketLiverpoolData"]
            if let i = itm{
                self.itemTicketLiverpoolData?.append(i)
            }
        }else{
            itemTicketLiverpoolData <- map["itemTicketLiverpoolData"]
        }
        
    }
    
}
