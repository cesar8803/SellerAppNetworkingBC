//
//  Storeslist.swift
//  BridgeCoreProject
//
//  Created by Alejandro Hernandez on 15/06/17.
//  Copyright © 2017 Alejandro Hernandez. All rights reserved.
//

import Foundation
import ObjectMapper

class Storeslist: Mappable{
    var storeData: [StoreData]?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        storeData <- map["storeData"]
    }
}
