//
//  SessionDataWD.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/5/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class SessionDataWD: Mappable{
    public var userName: String?
    public var promoOptions: [String]?
    public var lastTransactionNumber: Int?
    public var tendersMenu: TendersMenuWD?
    public var promoSuggestions: [String]?
    public var ticket: Ticket?
    public var trainingMode: Int?
    public var userNameId: Int?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        userName <- map["userName"]
        promoOptions <- map["promoOptions"]
        lastTransactionNumber <- map["lastTransactionNumber"]
        tendersMenu <- map["tendersMenu"]
        promoSuggestions <- map["promoSuggestions"]
        ticket <- map["ticket"]
        trainingMode <- map["trainingMode"]
        userNameId <- map["userNameId"]
    }
}
