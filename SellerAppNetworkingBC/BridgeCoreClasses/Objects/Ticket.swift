//
//  Ticket.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/5/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Ticket: Mappable{
    public var storeData: StoreData?
    public var originalItems: [String]?
    public var transactionName: String?
    public var employeeTransaction: Int?
    public var beginDateTime: String?
    public var discountsTotalByTax: [String]?
    public var forceKeys: Int?
    public var paymentsTotal: PaymentsTotal?
    public var deferredPrint: Int?
    public var originalDiscounts: [String]?
    public var isGiftsPlan: Int?
    public var ivaTotal: IvaTotal?
    public var arrobaClass: String?
    public var invoiced: Int?
    public var docNumber: String?
    public var configuredPaymentPlans: [String]?
    public var total: Total?
    public var totalBalance: TotalBalance?
    public var iibbPerceptions: IibbPerceptions?
    public var totalLoyaltyBenefits: TotalLoyaltyBenefits?
    public var discountsItemsTotal: DiscountsItemsTotal?
    public var transactionTitle: String?
    public var discounts: [String]?
    public var change: Change?
    public var receivedPaymentsReportData: [String]?
    public var additionalSubType: Int?
    public var checkPaymentPlans: [String]?
    public var transactionType: Int?
    public var status: Int?
    public var storeCode: String?
    public var internalTaxesTotal: InternalTaxesTotal?
    public var paqueteriaOffLine: Int?
    public var perceptionsTotal: PerceptionsTotal?
    public var discountsTotal: DiscountsTotal?
    public var totalsData: TotalsData?
    public var isConsulting: Int?
    public var transactionSuperType: Int?
    public var promoPaymentPlans: [String]?
    public var terminalCode: Int?
    public var transaccionRegalo: Int?
    public var userNameDescription: String?
    public var ticketVoidFlag: Int?
    public var date: String?
    public var giftTicket: Int?
    public var discountsPromoTotal: DiscountsPromoTotal?
    public var firstPurchaseDay: Int?
    public var transactionDolar: Int?
    public var transactionNumber: Int?
    public var dilisaCorporated: Int?
    public var contigencyFlag: Int?
    public var originalPayments: [String]?
    public var items: [String]?
    public var cashDrawerOpeningRequired: Int?
    public var endDateTime: String?
    public var subtotal: SubTotal?
    public var updateBines: Int?
    public var promoGifts: [String]?
    public var ivaPerceptions: IvaPerceptions?
    public var tenderSurchargeTotal: TendersurChargeTotal?
    public var payments: [String]?
    public var discountsTransactionTotal: DiscountsTransactionTotal?
    public var taxDetailPerceptions: [String]?
    public var userName: String?
    public var trainingModeFlag: Int?
    public var paymentsSurchargeTotal: Paymentssurchargetotal?
    
    required public init?(map: Map){
    }
    func mapping(map: Map){
        storeData <- map["storeData"]
        originalItems <- map["originalItems"]
        transactionName <- map["transactionName"]
        employeeTransaction <- map["employeeTransaction"]
        beginDateTime <- map["beginDateTime"]
        discountsTotalByTax <- map["discountsTotalByTax"]
        forceKeys <- map["forceKeys"]
        paymentsTotal <- map["paymentsTotal"]
        deferredPrint <- map["deferredPrint"]
        originalDiscounts <- map["originalDiscounts"]
        isGiftsPlan <- map["isGiftsPlan"]
        ivaTotal <- map["ivaTotal"]
        arrobaClass <- map["@class"]
        invoiced <- map["invoiced"]
        docNumber <- map["docNumber"]
        configuredPaymentPlans <- map["configuredPaymentPlans"]
        total <- map["total"]
        totalBalance <- map["totalBalance"]
        iibbPerceptions <- map["iibbPerceptions"]
        totalLoyaltyBenefits <- map["totalLoyaltyBenefits"]
        discountsItemsTotal <- map["discountsItemsTotal"]
        transactionTitle <- map["transactionTitle"]
        discounts <- map["discounts"]
        change <- map["change"]
        receivedPaymentsReportData <- map["receivedPaymentsReportData"]
        additionalSubType <- map["additionalSubType"]
        checkPaymentPlans <- map["checkPaymentPlans"]
        transactionType <- map["transactionType"]
        status <- map["status"]
        storeCode <- map["storeCode"]
        internalTaxesTotal <- map["internalTaxesTotal"]
        paqueteriaOffLine <- map["paqueteriaOffLine"]
        perceptionsTotal <- map["perceptionsTotal"]
        discountsTotal <- map["discountsTotal"]
        totalsData <- map["totalsData"]
        isConsulting <- map["isConsulting"]
        transactionSuperType <- map["transactionSuperType"]
        promoPaymentPlans <- map["promoPaymentPlans"]
        terminalCode <- map["terminalCode"]
        transaccionRegalo <- map["transaccionRegalo"]
        userNameDescription <- map["userNameDescription"]
        ticketVoidFlag <- map["ticketVoidFlag"]
        date <- map["date"]
        giftTicket <- map["giftTicket"]
        discountsPromoTotal <- map["discountsPromoTotal"]
        firstPurchaseDay <- map["firstPurchaseDay"]
        transactionDolar <- map["transactionDolar"]
        transactionNumber <- map["transactionNumber"]
        dilisaCorporated <- map["dilisaCorporated"]
        contigencyFlag <- map["contigencyFlag"]
        originalPayments <- map["originalPayments"]
        items <- map["items"]
        cashDrawerOpeningRequired <- map["cashDrawerOpeningRequired"]
        endDateTime <- map["endDateTime"]
        subtotal <- map["subtotal"]
        updateBines <- map["updateBines"]
        promoGifts <- map["promoGifts"]
        ivaPerceptions <- map["ivaPerceptions"]
        tenderSurchargeTotal <- map["tenderSurchargeTotal"]
        payments <- map["payments"]
        discountsTransactionTotal <- map["discountsTransactionTotal"]
        taxDetailPerceptions <- map["taxDetailPerceptions"]
        userName <- map["userName"]
        trainingModeFlag <- map["trainingModeFlag"]
        paymentsSurchargeTotal <- map["paymentsSurchargeTotal"]
    }
}
