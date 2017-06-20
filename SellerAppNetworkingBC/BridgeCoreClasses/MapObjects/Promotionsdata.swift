//
//  Promotionsdata.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class Promotionsdata: Mappable{
    var promotionData: [Promotiondata]?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        promotionData <- map["promotionData"]
    }
}
