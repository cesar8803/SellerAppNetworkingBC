//
//  Change.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/5/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

//Change

import Foundation
import ObjectMapper

public class Change: Mappable{
    public var number: String?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        switch map["number"].currentValue {
        case (let v as String):
            number = v
        case (let v as Float):
            number = String(v)
        default:
            debugPrint("You should add another kind of data")
        }
    }
}
