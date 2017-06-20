//
//  LPTerminalRepresentation.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation

public class LPTerminalRepresentation {
    public var terminalCode: Int = 0
    public var storeCode: String = ""
    public var status: String = ""
    // TODO: public var totalsData: LPTotalsData?
    public var mustCloseCashdrawerBeforeTransaction: Bool = false
    public var userWithTxInCourse: Int = 0
    public var transferredTx: Bool = false
    public var cashDrawerOpenAllowed: Bool = false
    public var printMode: Int = 0
    public var frankingMode: Int = 0
    public var checkReadingRequired: Bool = false
    public var automaticTransactionType: Int = 0
    public var automaticSignoff: Bool = false
    public var automaticLoan: Bool = false
    public var firstCashLimitExceeded: Bool = false
    public var secondCashLimitExceeded: Bool = false
    public var storeCloseInProgress: Bool = false
    public var storeClosed: Bool = false
    public var periodChanged: Bool = false
    public var subperiodChanged: Bool = false
    public var automaticLoanEuro: NSDecimalNumber = 0.0
    public var automaticLoanDollar: NSDecimalNumber = 0.0
    public var automaticLoanCash: NSDecimalNumber = 0.0
    public var automaticTransactionEnabledParameter: Bool = false
    public var autoCancelTrxAddCustomer: Bool = false
    public var optionalForceKeys: Bool = false
    // TODO: public var warrantyList = [LPWarranty]()
    public var warningMessageList: Array<String> = []
    
    init(mappableResponse: Representation?) {
        
        guard let response = mappableResponse else {
            return
        }
        
        self.terminalCode = response.terminalCode ?? 0
        self.storeCode = response.storeCode ?? ""
        self.status = response.status ?? ""
        
        // TODO: self.totalsData = LPTotalsData(bridgeCoreResponse: bridgeCoreResponse["totalsData"])
        
        self.mustCloseCashdrawerBeforeTransaction = response.mustCloseCashdrawerBeforeTransaction?.toBool() ?? false
        
        self.userWithTxInCourse = response.userWithTxInCourse ?? 0
        self.transferredTx = response.transferredTx?.toBool() ?? false
        
        self.cashDrawerOpenAllowed = response.cashDrawerOpenAllowed?.toBool() ?? false
        self.printMode = response.printMode ?? 0
        self.frankingMode = response.frankingMode ?? 0
        self.checkReadingRequired = response.checkReadingRequired?.toBool() ?? false
        self.automaticTransactionType = response.automaticTransactionType ?? 0
        self.automaticSignoff = response.automaticSignoff?.toBool() ?? false
        self.automaticLoan = response.automaticLoan?.toBool() ?? false
        
        self.firstCashLimitExceeded = response.firstCashLimitExceeded?.toBool() ?? false
        self.secondCashLimitExceeded = response.secondCashLimitExceeded?.toBool() ?? false
        self.storeCloseInProgress = response.storeCloseInProgress?.toBool() ?? false
        self.storeClosed = response.storeClosed?.toBool() ?? false
        self.periodChanged = response.periodChanged?.toBool() ?? false
        self.subperiodChanged = response.subperiodChanged?.toBool() ?? false
        self.automaticLoanEuro = NSDecimalNumber(string: response.automaticLoanEuro)
        self.automaticLoanDollar = NSDecimalNumber(string: response.automaticLoanDollar)
        self.automaticLoanCash = NSDecimalNumber(string: response.automaticLoanCash)
        self.automaticTransactionEnabledParameter = response.automaticTransactionEnabledParameter?.toBool() ?? false
        self.autoCancelTrxAddCustomer = response.autoCancelTrxAddCustomer?.toBool() ?? false
        self.optionalForceKeys = response.optionalForceKeys?.toBool() ?? false
        
        /* TODO
        
        if let warranties = bridgeCoreResponse["warrantyList"][0][LPBridgeCoreServiceResponseMapping.WarrantyData.rawValue].array {
            for warranty in warranties {
                warrantyList.append(LPWarranty(bcResponse: warranty))
            }
        }
        else {
            let singleWarranty = bridgeCoreResponse["warrantyList"][0][LPBridgeCoreServiceResponseMapping.WarrantyData.rawValue]
            if singleWarranty != nil {
                warrantyList.append(LPWarranty(bcResponse: singleWarranty))
            }
        }
        
        if let warningList = bridgeCoreResponse["warningList"][0][LPBridgeCoreServiceResponseMapping.WarningData.rawValue].array {
            for warningData in warningList {
                if let warning = warningData["message"].string {
                    self.warningMessageList.append(warning)
                }
                else if let warningArray = warningData[LPBridgeCoreServiceResponseMapping.WarningData.rawValue].array {
                    for warningDictionary in warningArray {
                        if let warningMsg = warningDictionary["message"].string {
                            if !warningMsg.isEmpty {
                                self.warningMessageList.append(warningMsg)
                            }
                        }
                    }
                }
            }
        } else if let warningListDict = bridgeCoreResponse["warningList"][0][LPBridgeCoreServiceResponseMapping.WarningData.rawValue].dictionary {
            if let message = warningListDict["message"]?.string {
                self.warningMessageList.append(message)
            }
        }
        */
    }
}
