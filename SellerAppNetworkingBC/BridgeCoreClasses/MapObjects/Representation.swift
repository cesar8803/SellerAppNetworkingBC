//
//  Representation.swift
//  BridgeCoreProject
//
//  Created by Alejandro Hernandez on 15/06/17.
//  Copyright © 2017 Alejandro Hernandez. All rights reserved.
//

import Foundation
import ObjectMapper

class Representation: Mappable {
    
    var status: String?
    var storeCode: String?
    var terminalCode: Int?
    var arrobaClass: String?
    var transferredTx: Int?
    var cashDrawerOpenAllowed: Int?
    var printMode: Int?
    var frankingMode: Int?
    var checkReadingRequired: Int?
    var automaticTransactionType: Int?
    var automaticSignoff: Int?
    var userWithTxInCourse: Int?
    var reasonSaleReturnMenu: Reasonsalereturnmenu?
    var binesID: String?
    var reasonSaleItemDiscountMenu: Reasonsaleitemdiscountmenu?
    var optionalForceKeys: Int?
    var secondCashLimitExceeded: Int?
    var reasonSaleCancelMenu: Reasonsalecancelmenu?
    var firstCashLimitExceeded: Int?
    var storeCloseInProgress: Int?
    var storeClosed: Int?
    var periodChanged: Int?
    var subperiodChanged: Int?
    var storesList: [Storeslist]?
    var automaticLoan: Int?
    var automaticLoanEuro: String?
    var automaticLoanDollar: String?
    var automaticLoanCash: String?
    var automaticTransactionEnabledParameter: Int?
    var autoCancelTrxAddCustomer: Int?
    var reasonSaleTransactionDiscountMenu: Reasonsaletransactiondiscountmenu?
    var mustCloseCashdrawerBeforeTransaction: Int?
    var sessionData: Sessiondata?
    var exceptionIndex: Int?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        status <- map["status"]
        storeCode <- map["storeCode"]
        terminalCode <- map["terminalCode"]
        arrobaClass <- map["@class"]
        transferredTx <- map["transferredTx"]
        cashDrawerOpenAllowed <- map["cashDrawerOpenAllowed"]
        printMode <- map["printMode"]
        frankingMode <- map["frankingMode"]
        checkReadingRequired <- map["checkReadingRequired"]
        automaticTransactionType <- map["automaticTransactionType"]
        automaticSignoff <- map["automaticSignoff"]
        userWithTxInCourse <- map["userWithTxInCourse"]
        reasonSaleReturnMenu <- map["reasonSaleReturnMenu"]
        binesID <- map["binesID"]
        reasonSaleItemDiscountMenu <- map["reasonSaleItemDiscountMenu"]
        optionalForceKeys <- map["optionalForceKeys"]
        secondCashLimitExceeded <- map["secondCashLimitExceeded"]
        reasonSaleCancelMenu <- map["reasonSaleCancelMenu"]
        firstCashLimitExceeded <- map["firstCashLimitExceeded"]
        storeCloseInProgress <- map["storeCloseInProgress"]
        storeClosed <- map["storeClosed"]
        periodChanged <- map["periodChanged"]
        subperiodChanged <- map["subperiodChanged"]
        storesList <- map["storesList"]
        automaticLoan <- map["automaticLoan"]
        automaticLoanEuro <- map["automaticLoanEuro"]
        automaticLoanDollar <- map["automaticLoanDollar"]
        automaticLoanCash <- map["automaticLoanCash"]
        reasonSaleTransactionDiscountMenu <- map["reasonSaleTransactionDiscountMenu"]
        mustCloseCashdrawerBeforeTransaction <- map["mustCloseCashdrawerBeforeTransaction"]
        sessionData <- map["sessionData"]
        exceptionIndex <- map["exceptionIndex"]
    }
    
}
