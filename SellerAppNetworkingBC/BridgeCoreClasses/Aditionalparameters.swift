//
//  Aditionalparameters.swift
//  SellerAppNetworkingBC
//
//  Created by nataly on 28/09/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//
import Foundation
import ObjectMapper

public class Aditionalparameters: Mappable{
    public var storeCode: String?
    public var terminalCode: Int?
    public var paymentAmount: String?
    public var bank: String?
    public var bankcode: Int?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        storeCode <- map["storeCode"]
        terminalCode <- map["terminalCode"]
        paymentAmount <- map["paymentAmount"]
        bank <- map["bank"]
        bankcode <- map["bankcode"]
    }
}
