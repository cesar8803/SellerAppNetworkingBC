//
//  OperationResult.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/3/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class OperationResult: Mappable{
    public var arrobaClass: String?
    public var exchangeCurrencyListData: [ExchangeCurrencyListData]?
    public var invoiced: Int?
    public var docNumber: String?
    
    /*******************************
     FindItems
     *******************************/
    public var currentLevel: Int?
    public var itemData: [ItemData]?
    public var hierarchyLevelData: [String]?
    public var hierarchyGroupData: [String]?
    public var totalPages: Int?
    
    /******************************/
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        exchangeCurrencyListData <- map["exchangeCurrencyListData"]
        arrobaClass <- map["@class"]
        invoiced <- map["invoiced"]
        docNumber <- map["docNumber"]
        
        /*******************************
         FindItems
         *******************************/
        currentLevel <- map["currentLevel"]
        itemData <- map["itemData"]
        hierarchyLevelData <- map["hierarchyLevelData"]
        hierarchyGroupData <- map["hierarchyGroupData"]
        totalPages <- map["totalPages"]
        arrobaClass <- map["@class"]
        /*******************************/
    }
}
