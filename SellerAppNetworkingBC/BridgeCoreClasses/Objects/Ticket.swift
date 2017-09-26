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
    public var promoPaymentPlansArray: [Promopaymentplans]?
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
    public var itemsTicket: [Items]?
    public var cashDrawerOpeningRequired: Int?
    public var endDateTime: String?
    public var subtotal: SubTotal?
    public var updateBines: Int?
    public var promoGifts: [String]?
    public var ivaPerceptions: IvaPerceptions?
    public var tenderSurchargeTotal: TendersurChargeTotal?
    public var payments: [Payments]?
    public var discountsTransactionTotal: DiscountsTransactionTotal?
    public var taxDetailPerceptions: [String]?
    public var userName: String?
    public var trainingModeFlag: Int?
    public var paymentsSurchargeTotal: PaymentsSurChargetotal?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
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
        
        if map["promoPaymentPlans"].currentValue is [String]{
            promoPaymentPlans <- map["promoPaymentPlans"]
        }else{
            promoPaymentPlansArray <- map["promoPaymentPlans"]
        }
        
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
        
        
        
        if let _ = map["items"].currentValue as? [String]{
            items <- map["items"]
        }else {
            itemsTicket <- map["items"]
        }
        
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

public class Promopaymentplans: Mappable{
    public var benefitData: [BenefitData]?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        benefitData <- map["benefitData"]
    }
}

public class Payments: Mappable
{
    public var paymentDataLiverpool: Paymentdataliverpool?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        paymentDataLiverpool <- map["paymentDataLiverpool"]
    }
}

public class Paymentdataliverpool: Mappable{
    public var count: Count?
    public var additionalData: [Additionaldata]?
    public var msi: Int?
    public var idTender: Int?
    public var descriptionPayment: String?
    public var autografa: Int?
    public var surcharge: Surcharge?
    public var isNew: Int?
    public var voided: Int?
    public var idTenderType: Int?
    public var amount: Amount?
    public var isOwnCredit: Int?
    public var eglobalCard: Int?
    public var isVoid: Int?
    public var isForeign: Int?
    public var qps: Int?
    public var nip: Int?
    public var sinFirma: Int?
    public var inputType: String?
    public var frankingRequired: Int?
    public var tenderGsaId: Int?
    
    public var bankDescription: String?
    public var originalAuthorization: String?
    public var description: String?
    public var selectedInstallmentAmount: Selectedinstallmentamount?
    public var bankAfiliation: Int?
    public var externalCoupon: Int?
    public var account: Int?
    public var selectedInstallments: Int?
    public var inputDescriptor: String?
    
    public var eGlobalCardList: [Eglobalcardlist]?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        count <- map["count"]
        additionalData <- map["additionalData"]
        msi <- map["msi"]
        idTender <- map["idTender"]
        descriptionPayment <- map["description"]
        autografa <- map["autografa"]
        surcharge <- map["surcharge"]
        isNew <- map["isNew"]
        voided <- map["voided"]
        idTenderType <- map["idTenderType"]
        amount <- map["amount"]
        isOwnCredit <- map["isOwnCredit"]
        eglobalCard <- map["eglobalCard"]
        isVoid <- map["isVoid"]
        isForeign <- map["isForeign"]
        qps <- map["qps"]
        nip <- map["nip"]
        sinFirma <- map["sinFirma"]
        inputType <- map["inputType"]
        frankingRequired <- map["frankingRequired"]
        tenderGsaId <- map["tenderGsaId"]
        
        bankDescription <- map["bankDescription"]
        originalAuthorization <- map["originalAuthorization"]
        description <- map["description"]
        selectedInstallmentAmount <- map["selectedInstallmentAmount"]
        bankAfiliation <- map["bankAfiliation"]
        externalCoupon <- map["externalCoupon"]
        account <- map["account"]
        selectedInstallments <- map["selectedInstallments"]
        inputDescriptor <- map["inputDescriptor"]
        eGlobalCardList <- map["eGlobalCardList"]
    }
}

public class Eglobalcardlist: Mappable{
    public var eglobalCard: Eglobalcard?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        eglobalCard <- map["eglobalCard"]
    }
}

public class Eglobalcard: Mappable{
    public var account: String?
    public var amount: Amount?
    public var entered: Int?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        account <- map["account"]
        amount <- map["amount"]
        entered <- map["entered"]
    }
}

public class Selectedinstallmentamount: Mappable{
    var number: Int?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        number <- map["number"]
    }
}

public class Count: Mappable{
    public var number: Int?
    
    required  public init?(map: Map){
    }
    public func mapping(map: Map){
        number <- map["number"]
    }
}

public class Additionaldata: Mappable
{
    public var cardPrefixType: Int?
    public var PINPAD__RESPONSE__EMV__TAGS: String?
    public var ad__InputDto: String?
    public var PINPAD__RESPONSE__TOKENS: String?
    public var additionalDataListField: [AdditionalDataListField]?
    
    required public init?( map: Map){
    }
    public func mapping(map: Map){
        cardPrefixType <- map["cardPrefixType"]
        PINPAD__RESPONSE__EMV__TAGS <- map["PINPAD__RESPONSE__EMV__TAGS"]
        ad__InputDto <- map["ad__InputDto"]
        PINPAD__RESPONSE__TOKENS <- map["PINPAD__RESPONSE__TOKENS"]
        additionalDataListField <- map["additionalDataListField"]
    }
}

public class Surcharge: Mappable{
    public var number: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        number <- map["number"]
    }
}
