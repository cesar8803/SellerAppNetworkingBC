//
//  Promooptions.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class Promooptions: Mappable{
    var promoOptionData: [Promooptiondata]?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        promoOptionData <- map["promoOptionData"]
    }
}
