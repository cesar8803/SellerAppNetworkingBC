//
//  Reasonsaletransactiondiscountmenu.swift
//  BridgeCoreProject
//
//  Created by Alejandro Hernandez on 15/06/17.
//  Copyright © 2017 Alejandro Hernandez. All rights reserved.
//

import Foundation
import ObjectMapper

class Reasonsaletransactiondiscountmenu: Mappable{
    var extendedProperties: [String]?
    var options: [String]?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        extendedProperties <- map["extendedProperties"]
        options <- map["options"]
    }
}
