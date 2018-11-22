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
    public var serviceItemCode: String?
    public var description: String?
    public var netCost: Netcost?
    public var warrantedItemSeq: Int?
    public var itemPrice: Itemprice?
    public var percentage: Percentage?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        serviceItemCode <- map["serviceItemCode"]
        
        switch map["serviceItemCode"].currentValue {
        case (let v as String):
            serviceItemCode = v
        case (let v as Int):
            serviceItemCode = String(v)
        default:
            debugPrint("You should add another kind of data")
        }
        
        description <- map["description"]
        netCost <- map["netCost"]
        warrantedItemSeq <- map["warrantedItemSeq"]
        itemPrice <- map["itemPrice"]
        percentage <- map["percentage"]
    }
}



public class Netcost: Mappable{
    public var number: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        
        switch map["number"].currentValue {
        case (let v as String):
            number = v
        case (let v as Double):
            number = String(v)
        default:
            debugPrint("You should add another kind of data")
        }
    }
}

public class Itemprice: Mappable{
    public var number: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        
        switch map["number"].currentValue {
        case (let v as String):
            number = v
        case (let v as Double):
            number = String(v)
        default:
            debugPrint("You should add another kind of data")
        }
    }
}


public class Percentage: Mappable{
    public var number: String?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        switch map["number"].currentValue {
        case (let v as String):
            number = v
        case (let v as Double):
            number = String(v)
        default:
            debugPrint("You should add another kind of data")
        }
    }
}


