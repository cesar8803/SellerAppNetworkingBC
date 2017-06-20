//
//  Optionmenu.swift
//  BridgeCoreProject
//
//  Created by Alejandro Hernandez on 15/06/17.
//  Copyright © 2017 Alejandro Hernandez. All rights reserved.
//

import Foundation
import ObjectMapper

class Optionmenu: Mappable{
    var optionNumber: Int?
    var extendedProperties: [String]?
    var optionName: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        optionNumber <- map["optionNumber"]
        extendedProperties <- map["extendedProperties"]
        optionName <- map["optionName"]
    }
}
