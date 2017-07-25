//
//  ItemLiverpoolData.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/25/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class ItemLiverpoolData: Mappable{
    public var returnNotAllowedFlag: Int?
    public var disabled: Int?
    public var foodStampFlag: Int?
    public var priceInputTypeIndicator: String?
    public var notForSaleFlag: Int?
    public var restrictedSaleFlag: Int?
    public var lineType: String?
    public var quantityAllowedFlag: Int?
    public var description: String?
    public var price: Price?
    public var logExceptionFlag: Int?
    public var brandCode: Int?
    public var kitComponentFlag: Int?
    public var notForDiscountsFlag: Int?
    public var itemCode: Int?
    public var weightRequiredFlag: Int?
    public var tagPromo: String?
    public var supplierCode: String?
    public var hierarchyGroup: HierarchyGroup?
    public var quantityRequiredFlag: Int?
    public var authorizationRequiredFlag: Int?
    public var stockReservationRequiredFlag: Int?
    public var genericItemFlag: Int?
    public var groupCode: String?
    public var serialNumberRequiredFlag: Int?
    public var priceRequiredFlag: Int?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        returnNotAllowedFlag <- map["returnNotAllowedFlag"]
        disabled <- map["disabled"]
        foodStampFlag <- map["foodStampFlag"]
        priceInputTypeIndicator <- map["priceInputTypeIndicator"]
        notForSaleFlag <- map["notForSaleFlag"]
        restrictedSaleFlag <- map["restrictedSaleFlag"]
        lineType <- map["lineType"]
        quantityAllowedFlag <- map["quantityAllowedFlag"]
        description <- map["description"]
        price <- map["price"]
        logExceptionFlag <- map["logExceptionFlag"]
        brandCode <- map["brandCode"]
        kitComponentFlag <- map["kitComponentFlag"]
        notForDiscountsFlag <- map["notForDiscountsFlag"]
        itemCode <- map["itemCode"]
        weightRequiredFlag <- map["weightRequiredFlag"]
        tagPromo <- map["tagPromo"]
        supplierCode <- map["supplierCode"]
        hierarchyGroup <- map["hierarchyGroup"]
        quantityRequiredFlag <- map["quantityRequiredFlag"]
        authorizationRequiredFlag <- map["authorizationRequiredFlag"]
        stockReservationRequiredFlag <- map["stockReservationRequiredFlag"]
        genericItemFlag <- map["genericItemFlag"]
        groupCode <- map["groupCode"]
        serialNumberRequiredFlag <- map["serialNumberRequiredFlag"]
        priceRequiredFlag <- map["priceRequiredFlag"]
    }
}
