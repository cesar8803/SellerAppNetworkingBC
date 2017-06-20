//
//  Benefitdata.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class Benefitdata: Mappable{
    var displayMessage: String?
    var promoId: String?
    var tlogMessage: String?
    var benefitType: String?
    var printerMessage: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        displayMessage <- map["displayMessage"]
        promoId <- map["promoId"]
        tlogMessage <- map["tlogMessage"]
        benefitType <- map["benefitType"]
        printerMessage <- map["printerMessage"]
    }
}
