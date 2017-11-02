//
//  OptionsGroupsSelected.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/8/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class OptionsGroupsSelected: Mappable{
    public var optionGroupSelected: OptionGroupSelected?
    
    required public  init?(map: Map){
    }
    
    public func mapping(map: Map){
        optionGroupSelected <- map["optionGroupSelected"]
    }
}
