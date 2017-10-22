//
//  HierarchyGroup.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/25/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class HierarchyGroup: Mappable{
    public var disabled: Int?
    public var code: Int?
    public var description: Int?
    
    required public  init?(map: Map){
    }
    
    public func mapping(map: Map){
        disabled <- map["disabled"]
        code <- map["code"]
        description <- map["description"]
    }
}
