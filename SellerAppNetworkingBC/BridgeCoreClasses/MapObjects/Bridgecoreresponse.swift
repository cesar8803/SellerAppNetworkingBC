//
//  Bridgecoreresponse.swift
//  BridgeCoreProject
//
//  Created by Alejandro Hernandez on 15/06/17.
//  Copyright © 2017 Alejandro Hernandez. All rights reserved.
//

import Foundation
import ObjectMapper

class Bridgecoreresponse: Mappable{
    var actualActivity: String?
    var ack: Int?
    var connectionId: String?
    var operationResult: Operationresult?
    var version: String?
    var representation: Representation?
    var message: String?
    
    required init?(map: Map){
        
        mapping(map: map)
    }
    
    func mapping(map: Map){
        actualActivity <- map["actualActivity"]
        ack <- map["ack"]
        connectionId <- map["connectionId"]
        operationResult <- map["operationResult"]
        version <- map["version"]
        representation <- map["representation"]
        message <- map["message"]
    }
}

