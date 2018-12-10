//
//  WarningList.swift
//  SellerAppNetworkingBC
//
//  Created by HAROJASD on 12/1/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class WarningList: Mappable{
    public var warrantyData: WarningData?
    public var warningData: WarningData?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        warrantyData <- map["warningData"]
        warningData <- map["warningData"]
    }
}

public class WarningData: Mappable{
    public var message: String?
    public var large: Bool?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        message <- map["message"]
        large <- map["large"]
    }
}
