//
//  TentativeAmount.swift
//  SellerAppNetworkingBC
//
//  Created by IGARCIAC01 on 11/2/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//



import Foundation
import ObjectMapper

public class TentativeAmount: Mappable{
    public var number: String?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        if let numString = map["number"].currentValue as? Double{
            number =  String(numString )
        }else{
            number <- map["number"]
        }
    }
}

