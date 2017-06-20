//
//  Promotiondata.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class Promotiondata: Mappable{
    var benefitsData: [Benefitsdata]?
    var promoId: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        benefitsData <- map["benefitsData"]
        promoId <- map["promoId"]
    }
}
