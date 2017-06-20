//
//  Sessiondata.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class Sessiondata: Mappable{
    
    var userName: String?
    var promoOptions: [Promooptions]?
    var lastTransactionNumber: Int?
    var tendersMenu: Tendersmenu?
    var promoSuggestions: [String]?
    // TODO: var ticket: Ticket?
    var trainingMode: Int?
    var userNameId: Int?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map){
        userName <- map["userName"]
        promoOptions <- map["promoOptions"]
        lastTransactionNumber <- map["lastTransactionNumber"]
        tendersMenu <- map["tendersMenu"]
        promoSuggestions <- map["promoSuggestions"]
        //TODO: ticket <- map["ticket"]
        trainingMode <- map["trainingMode"]
        userNameId <- map["userNameId"]
    }
    
}
