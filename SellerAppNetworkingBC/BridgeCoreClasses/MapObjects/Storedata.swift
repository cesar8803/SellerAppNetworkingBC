//
//  Storedata.swift
//  BridgeCoreProject
//
//  Created by Alejandro Hernandez on 15/06/17.
//  Copyright © 2017 Alejandro Hernandez. All rights reserved.
//

import Foundation
import ObjectMapper

class Storedata: Mappable{
    var storeCode: String?
    var description: String?
    var longDescription: String?
    var storeType: String?
    var id: Int?
    var storeSubType: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        storeCode <- map["storeCode"]
        description <- map["description"]
        longDescription <- map["longDescription"]
        storeType <- map["storeType"]
        id <- map["id"]
        storeSubType <- map["storeSubType"]
    }
}
