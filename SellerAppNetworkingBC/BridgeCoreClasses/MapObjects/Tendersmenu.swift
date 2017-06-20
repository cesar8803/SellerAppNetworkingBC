//
//  Tendersmenu.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class Tendersmenu: Mappable{
    var extendedProperties: [String]?
    var options: [String]?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        extendedProperties <- map["extendedProperties"]
        options <- map["options"]
    }
}
