//
//  Scripts.swift
//  SellerAppNetworkingBC
//
//  Created by ADAIR ROJAS on 3/12/19.
//  Copyright © 2019 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Scripts: Mappable{
    
    public var type : String?
    public var firstC25num: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        firstC25num <- map["firstC25num"]
        
        switch map["type"].currentValue {
        case (let v as String):
            type = v
        case (let v as Double):
            type = String(v)
        default:
            debugPrint("You should add another kind of data")
        }
    }
}


