//
//  Options.swift
//  BridgeCoreProject
//
//  Created by Alejandro Hernandez on 15/06/17.
//  Copyright © 2017 Alejandro Hernandez. All rights reserved.
//

import Foundation
import ObjectMapper

class Options: Mappable{
    var optionMenu: [Optionmenu]?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        optionMenu <- map["optionMenu"]
    }
}
