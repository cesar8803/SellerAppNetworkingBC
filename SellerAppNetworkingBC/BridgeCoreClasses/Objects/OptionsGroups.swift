//
//  OptionsGroups.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/8/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper


public class OptionsGroups: Mappable{
    public var optionGroup: OptionGroup?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        optionGroup <- map["optionGroup"]
    }
}
