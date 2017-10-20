//
//  ItemTicketLiverpoolData.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 9/6/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class ItemTicketLiverpoolData: Mappable{
    public var unitOfMeasureDecimals: Int?
    public var code: Int?
    public var entryMethod: EntryMethod?
    public var saleForDelivery: Int?
    public var sequenceNumber: Int?
    public var isNew: Int?
    public var isReturned: Int?
    public var actualUnitPrice: ActualUnitPrice?
    public var discountCouponsTotal: DiscountCouponsTotal?
    public var priceInputTypeIndicator: String?
    public var vatAmount: VatAmount?
    public var originalNetValue: OriginalNetValue?
    public var surcharge: Int?
    public var originalExtendedPrice: OriginalExtendedPrice?
    public var originalTaxesAmount: OriginalTaxesAmount?
    public var ownBrand: String?
    public var internalTaxes: InternalTaxes?
    public var qty: Qty?
    public var isGeneric: Int?
    public var customsDate: String?
    public var voidedQuantity: VoidedQuantity?
    public var regularUnitPrice: RegularUnitPrice?
    public var exchangeReturn: Int?
    public var discountTotal: DiscountTotal?
    public var lineType: String?
    public var units: Units?
    public var importDocRequired: Int?
    public var crediAssurance: Int?
    public var itemTicketStockInformationList: [String]?
    public var isOriginalTransactionItem: Int?
    public var recordInExceptionLog: Int?
    public var description: String?
    public var internalTaxPercentage: InternalTaxPercentage?
    public var vatCode: Int?
    public var reserved: Int?
    public var priceRequired: Int?
    public var discountAmntTotal: DiscountAmntTotal?
    public var voided: Int?
    public var unitOfMeasureCode: String?
    public var itemWarranty: Int?
    public var giftItem: Int?
    public var discountPerTotal: DiscountPerTotal?
    public var extendedPrice: ExtendedPrice?
    public var netValue: NetValue?
    public var merchandiseHierarchy: Int?
    public var serialNumberRequired: Int?
    public var itemSuggestedBenefits: [String]?
    public var typeCode: String?
    public var vatPercentage: VatPercentage?
    public var snackBar: Int?
    public var isLinkedItem: Int?
    public var itemPaymentPlans: [ItemPaymentPlans]?
    public var fixedInternalTax: Int?
    public var isVoid: Int?
    public var villaNevada: Int?
    public var discountPromoTotal: DiscountPromoTotal?
    public var monederoBenefits: [String]?
    public var monederoBenefitsArray: [monederoBenefits]?
    public var optionsGroups: [OptionsGroups]?
    public var discounts: [Discounts]?
    public var promotions: [Promotions]?
    public var paymentPlanList: [paymentPlanList]?
    
    public var optionsGroupsSelected: [OptionsGroupsSelected]?

    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        unitOfMeasureDecimals <- map["unitOfMeasureDecimals"]
        code <- map["code"]
        entryMethod <- map["entryMethod"]
        saleForDelivery <- map["saleForDelivery"]
        sequenceNumber <- map["sequenceNumber"]
        isNew <- map["isNew"]
        isReturned <- map["isReturned"]
        actualUnitPrice <- map["actualUnitPrice"]
        discountCouponsTotal <- map["discountCouponsTotal"]
        priceInputTypeIndicator <- map["priceInputTypeIndicator"]
        vatAmount <- map["vatAmount"]
        originalNetValue <- map["originalNetValue"]
        surcharge <- map["surcharge"]
        originalExtendedPrice <- map["originalExtendedPrice"]
        originalTaxesAmount <- map["originalTaxesAmount"]
        ownBrand <- map["ownBrand"]
        internalTaxes <- map["internalTaxes"]
        qty <- map["qty"]
        isGeneric <- map["isGeneric"]
        customsDate <- map["customsDate"]
        voidedQuantity <- map["voidedQuantity"]
        regularUnitPrice <- map["regularUnitPrice"]
        exchangeReturn <- map["exchangeReturn"]
        discountTotal <- map["discountTotal"]
        lineType <- map["lineType"]
        units <- map["units"]
        importDocRequired <- map["importDocRequired"]
        crediAssurance <- map["crediAssurance"]
        itemTicketStockInformationList <- map["itemTicketStockInformationList"]
        isOriginalTransactionItem <- map["isOriginalTransactionItem"]
        recordInExceptionLog <- map["recordInExceptionLog"]
        description <- map["description"]
        internalTaxPercentage <- map["internalTaxPercentage"]
        vatCode <- map["vatCode"]
        reserved <- map["reserved"]
        priceRequired <- map["priceRequired"]
        discountAmntTotal <- map["discountAmntTotal"]
        voided <- map["voided"]
        unitOfMeasureCode <- map["unitOfMeasureCode"]
        itemWarranty <- map["itemWarranty"]
        giftItem <- map["giftItem"]
        discountPerTotal <- map["discountPerTotal"]
        extendedPrice <- map["extendedPrice"]
        netValue <- map["netValue"]
        merchandiseHierarchy <- map["merchandiseHierarchy"]
        serialNumberRequired <- map["serialNumberRequired"]
        itemSuggestedBenefits <- map["itemSuggestedBenefits"]
        typeCode <- map["typeCode"]
        vatPercentage <- map["vatPercentage"]
        snackBar <- map["snackBar"]
        isLinkedItem <- map["isLinkedItem"]
        itemPaymentPlans <- map["itemPaymentPlans"]
        fixedInternalTax <- map["fixedInternalTax"]
        isVoid <- map["isVoid"]
        villaNevada <- map["villaNevada"]
        discountPromoTotal <- map["discountPromoTotal"]
        
        switch map["monederoBenefits"].currentValue{
            
        case is [String]:
            
             monederoBenefits <- map["monederoBenefits"]
            
            
        case is [[String:Any]]:
        
            monederoBenefitsArray <- map["monederoBenefits"]
            
            
        default:
            debugPrint("promoOptionData is other type")
        }
        
        optionsGroupsSelected <- map["optionsGroupsSelected"]
        optionsGroups <- map["optionsGroups"]
        discounts <- map["discounts"]
        promotions <- map["promotions"]
        
        paymentPlanList <- map["paymentPlanList"]
    }
}
