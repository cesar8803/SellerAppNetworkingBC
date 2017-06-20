//
//  Operationresult.swift
//  BridgeCoreProject
//
//  Created by Alejandro Hernandez on 15/06/17.
//  Copyright © 2017 Alejandro Hernandez. All rights reserved.
//

import Foundation
import ObjectMapper

class Operationresult: Mappable{
    var ps: String?
    var arrobaClass: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        ps <- map["$"]
        arrobaClass <- map["@class"]
    }
}
