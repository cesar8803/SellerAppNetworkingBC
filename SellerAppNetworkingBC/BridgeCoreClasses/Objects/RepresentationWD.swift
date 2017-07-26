//
//  Representation.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/5/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class RepresentationWD: Mappable{
    public var status: String?
    public var storeCode: String?
    public var terminalCode: Int?
    public var sessionData: SessionDataWD?
    public var logoffMessageOnExtDisplay: String?
    public var cashDrawerOpenAllowed: Int?
    public var frankingMode: Int?
    public var checkReadingRequired: Int?
    public var logonMessageOnExtDisplay: String?
    public var arrobaClass: String?
    public var firstCashLimitExceeded: Int?
    public var printMode: Int?
    public var storeCloseInProgress: Int?
    public var optionalForceKeys: Int?
    public var secondCashLimitExceeded: Int?
    public var totalsData: TotalsData?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        status <- map["status"]
        storeCode <- map["storeCode"]
        terminalCode <- map["terminalCode"]
        sessionData <- map["sessionData"]
        logoffMessageOnExtDisplay <- map["logoffMessageOnExtDisplay"]
        cashDrawerOpenAllowed <- map["cashDrawerOpenAllowed"]
        frankingMode <- map["frankingMode"]
        checkReadingRequired <- map["checkReadingRequired"]
        logonMessageOnExtDisplay <- map["logonMessageOnExtDisplay"]
        arrobaClass <- map["@class"]
        firstCashLimitExceeded <- map["firstCashLimitExceeded"]
        printMode <- map["printMode"]
        storeCloseInProgress <- map["storeCloseInProgress"]
        optionalForceKeys <- map["optionalForceKeys"]
        secondCashLimitExceeded <- map["secondCashLimitExceeded"]
        totalsData <- map["totalsData"]
    }
}
