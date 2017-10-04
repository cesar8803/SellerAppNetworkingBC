//
//  Warrantydata.swift
//  SellerAppNetworkingBC
//
//  Created by nataly on 02/10/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Warrantydata: Mappable{
    public var serviceItemCode: Int?
    public var description: String?
    public var netCost: Netcost?
    public var warrantedItemSeq: Int?
    public var itemPrice: Itemprice?
    public var percentage: Percentage?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        serviceItemCode <- map["serviceItemCode"]
        description <- map["description"]
        netCost <- map["netCost"]
        warrantedItemSeq <- map["warrantedItemSeq"]
        itemPrice <- map["itemPrice"]
        percentage <- map["percentage"]
    }
}



public class Netcost: Mappable{
    public var number: Float?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        number <- map["number"]
    }
}

public class Itemprice: Mappable{
    public var number: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        number <- map["number"]
    }
}


public class Percentage: Mappable{
    public var number: Int?
    
    public required init?(map: Map){
    }
   public func mapping(map: Map){
        number <- map["number"]
    }
}


