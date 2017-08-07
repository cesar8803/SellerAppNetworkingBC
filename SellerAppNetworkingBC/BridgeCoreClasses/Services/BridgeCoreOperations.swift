//
//  BridgeCoreOperations.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/25/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

public typealias ErrorStringHandlerBC = (_ errorString:String) -> Void


public enum BridgeCoreOperationName:String
{
    case selectEnableCoins = "selectEnableCoins"
    case selectTransaction = "selectTransaction"
    case addTender = "addTender"
    case finishTransaction = "finishTransaction"
    case cancelTransaction = "cancelTransaction"
    case findItems = "findItems"
    case findItemsList = "findItemsList"
    case getBudget = "calculateBudget"
    case returnSelect = "returnSelect"
    case addItem = "addItem"
    case applyDiscountToItem = "applyDiscountToItem"
    case totalizeTransaction = "totalizeTransaction"
    case addMonederoPayment = "addMonederoPayment"
}

public enum BCTransactionSubtype: String {
    case TENDER_WITHDRAWAL = "7"
    case SALE_NORMAL = "101"
    case SALE_SOMS = "102"
    case SALE_DULCERIA = "103"
    case SALE_RESTAURANTE = "104"
    case SALE_RESTAURANTE_SKU = "130"
    case REFUND_NORMAL = "105"
    case SALE_VW = "111"
    case CANCEL_TRANSACTION = "112"
    case SALE_GARANTIA = "113"
    case TERMINAL_CLOSE = "114"
    case SALE_GIFTS_PLAN="115"
    case SALE_ELECTRONIC_GIFT="116"
    case PACKAGE="117"
    case SALE_MONEDERO="118"
    case PAYMENT_TOTAL_CARD="119"
    case PAYMENT_SEGMENT_CARD = "120"
    case REFUND_GIFTS_PLAN = "121"
    case REFUND_SOMS = "106"
}

public enum BCParamsNames: String{
    case refundOriginalTrxScannedCode = "refundOriginalTrxScannedCode"
    case transactionSubtype = "transactionSubtype"
    case refundOriginalEmployee = "refundOriginalEmployee"
    case originalTrxStore = "originalTrxStore"
    case refundCause = "refundCause"
    case giftTicket = "giftTicket"
    case scannedCodeEntryMethod = "scannedCodeEntryMethod"
    case itemPrice = "itemPrice"
    case itemDepartment = "itemDepartment"
    case itemDepartmentPrice = "itemDepartmentPrice"
    case itemQty = "itemQty"
    case itemBarcode = "itemBarcode"
    case processPromotions = "processPromotions"
    case sequenceNumber = "sequenceNumber"
    case discountType = "discountType"
    case discountValue = "discountValue"
    
    case promoOptionSelected = "promoOptionSelected"
    case supervisorEntryMethod = "supervisorEntryMethod"
    case supervisorPassword = "supervisorPassword"
    case supervisorName = "supervisorName"
    
    case paymentAmount = "paymentAmount"
    case account = "account"
    case paymentMethod = "paymentMethod"
    case entryMethod = "entryMethod"
}

public enum BCRequestParams{
    case refundNormalTransaction(refundOriginalTrxScannedCode:String,
        transactionSubtype: String,
        refundOriginalEmployee:String,
        originalTrxStore:String,
        refundCause:Int,
        giftTicket:Bool,
        scannedCodeEntryMethod:String)
        
    case additem(itemPrice:String,
        itemDepartment: String,
        itemDepartmentPrice: String,
        itemQty: String,
        itemBarcode: String,
        processPromotions:Bool)
    
    
    case applydiscount(
        processPromotions: Bool,
        sequenceNumber: Int,
        discountType: Int,
        discountValue: Double)
    
    
    
    case totalizeTransaction(processPromotions:Bool)
    
    case totalizeTransactionAutorized(
        promoOptionSelected:Int,
        supervisorEntryMethod:String,
        processPromotions:Bool,
        supervisorPassword:String,
        supervisorName:String)
    
    case addPurse(paymentAmount:String, account: String, paymentMethod:String, entryMethod: String)
    
    public func getParamsForRequest()->Parameters
    {
        switch self{
        case .refundNormalTransaction(let refundOriginalTrxScannedCode,
                                      let transactionSubtype,
                                       let refundOriginalEmployee,
                                       let originalTrxStore,
                                       let refundCause,
                                       let giftTicket,
                                       let scannedCodeEntryMethod):
            
            let params:Parameters = [BCParamsNames.refundOriginalTrxScannedCode.rawValue:refundOriginalTrxScannedCode,
                                     BCParamsNames.transactionSubtype.rawValue: transactionSubtype,
                                     BCParamsNames.refundOriginalEmployee.rawValue:refundOriginalEmployee,
                                     BCParamsNames.originalTrxStore.rawValue: originalTrxStore,
                                     BCParamsNames.refundCause.rawValue:refundCause,
                                     BCParamsNames.giftTicket.rawValue: giftTicket,
                                     BCParamsNames.scannedCodeEntryMethod.rawValue: scannedCodeEntryMethod]
            
            return params
            
        case .additem(let itemPrice, let itemDepartment, let itemDepartmentPrice, let itemQty, let itemBarcode, let processPromotions):
            let params: Parameters = [BCParamsNames.itemPrice.rawValue: itemPrice,
                                     BCParamsNames.itemDepartment.rawValue: itemDepartment,
                                     BCParamsNames.itemDepartmentPrice.rawValue: itemDepartmentPrice,
                                     BCParamsNames.itemQty.rawValue:itemQty,
                                     BCParamsNames.itemBarcode.rawValue:itemBarcode,
                                     BCParamsNames.processPromotions.rawValue:processPromotions]
            return params
            
        case .applydiscount(let processPromotions, let sequenceNumber, let discountType, let discountValue):
            
            let params: Parameters = [BCParamsNames.processPromotions.rawValue: processPromotions,
                                     BCParamsNames.sequenceNumber.rawValue: sequenceNumber,
                                     BCParamsNames.discountType.rawValue: discountType,
                                     BCParamsNames.discountValue.rawValue: discountValue]
            return params
            
        case .totalizeTransaction(let processPromotions):
            let params: Parameters = [BCParamsNames.processPromotions.rawValue: processPromotions]
            return params
            
        case .totalizeTransactionAutorized(let promoOptionSelected, let supervisorEntryMethod, let processPromotions, let supervisorPassword, let supervisorName):
            
            let params: Parameters = [BCParamsNames.promoOptionSelected.rawValue:promoOptionSelected,
                                      BCParamsNames.supervisorEntryMethod.rawValue:supervisorEntryMethod,
                                      BCParamsNames.processPromotions.rawValue: processPromotions,
                                      BCParamsNames.supervisorPassword.rawValue: supervisorPassword,
                                      BCParamsNames.supervisorName.rawValue: supervisorName]
            return params
        case .addPurse(let paymentAmount, let account, let paymentMethod, let entryMethod):
            
            let params: Parameters = [BCParamsNames.paymentAmount.rawValue:paymentAmount,
                                      BCParamsNames.account.rawValue:account,
                                      BCParamsNames.paymentMethod.rawValue: paymentMethod,
                                      BCParamsNames.entryMethod.rawValue: entryMethod]
            return params
        }
    }
}




public enum BridgeCoreOperation
{
    case selectTransaction(connectionId:String, terminalCode:String, storeCode:String,  transactionSubtype:BCTransactionSubtype, giftTicket:Bool)
    
    case addTender(connectionId:String, terminalCode:String, storeCode:String, paymentAmount: String,
        voidFalg: Bool,
        paymentMethod: String,
        paymentQuantity: String)
    
    case finishTransaction(connectionId:String, terminalCode:String, storeCode:String)
    
    case cancelTransaction(connectionId:String, terminalCode:String, storeCode:String)
    
    case cancelTransactionWithDocument(connectionId:String, terminalCode:String, storeCode:String, document:String, amount:String)
    
    case findItem( terminalCode:String, storeCode:String, itemCode:String,exactMaching:Bool)
    
    case findItemList( terminalCode:String, storeCode:String, itemsCodeList:[String])
    
    case getBudget( terminalCode: String, storeCode: String, budgetAmount: String?, selectedPlan: String?)
    
    case returnSelect(connectionId:String)
    
    //Generic Select Transaction
    // A generic function
    case selectTransactionWithParams(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case addItem(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case applyDiscount(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case totalizeTransaction(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case cardCancel( connectionId: String, operation: String, terminalCode:String, storeCode:String, object:Any)
    
    case addPurse(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case finishTransactionWithParams(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    func getParams()->(Parameters, String, String)
    {
        switch self
        {
        case .selectTransaction(let connectionId, let terminalCode, let storeCode , let transactionSubtype, let giftTicket):
            let p:[String:Any] = ["transactionSubtype":transactionSubtype.rawValue, "giftTicket": giftTicket]
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":BridgeCoreOperationName.selectTransaction.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
            
        case .addTender(let connectionId, let terminalCode,let  storeCode, let paymentAmount, let voidFalg, let paymentMethod, let paymentQuantity):
            let p:[String:Any] = ["paymentAmount": paymentAmount,
                                  "voidFalg": voidFalg,
                                  "paymentMethod": paymentMethod,
                                  "paymentQuantity": paymentQuantity]
            
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":BridgeCoreOperationName.addTender.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
            
        case .finishTransaction(let connectionId, let terminalCode,let  storeCode):
            let p:[String:Any] = [String:Any]()
            
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":BridgeCoreOperationName.finishTransaction.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
            
        case .cancelTransaction(let connectionId, let terminalCode,let  storeCode):
            let p:[String:Any] = [String:Any]()
            
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":BridgeCoreOperationName.cancelTransaction.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
            
        case .cancelTransactionWithDocument(let connectionId, let terminalCode, let storeCode, let document, let amount):
            let p:[String:Any] = ["transactionSubtype":BCTransactionSubtype.CANCEL_TRANSACTION.rawValue, "amountTrxCancel": amount, "numTrxCancel":document]
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":BridgeCoreOperationName.selectTransaction.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
            
        case .findItem(let terminalCode, let storeCode, let itemCode, let exactMaching):
            let p:[String:Any] = ["terminalCode":terminalCode, "storeCode": storeCode, "itemCode":itemCode, "itemCodeExactMatching":exactMaching]
            let bridgeCoreRequestDict:[String : Any] = ["operation":BridgeCoreOperationName.findItems.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
            
        case .findItemList(let terminalCode, let storeCode, let itemsCodeList):
            
            var valuesTypes:[[String:Any]] = [[String:Any]]()
            for itemCode in itemsCodeList
            {
                var dict:[String:Any] = [String:Any]()
                dict["itemCode"] = itemCode
                dict["@type"] = "map"
                valuesTypes.append(dict)
            }
            
            let valueDict = ["value":valuesTypes]
            
            let p:[String:Any] = ["terminalCode":terminalCode, "storeCode": storeCode, "itemDataList":valueDict]
            let bridgeCoreRequestDict:[String : Any] = ["operation":BridgeCoreOperationName.findItemsList.rawValue, "params":p]
            
            
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
            
        case .getBudget(let terminalCode, let storeCode, let budgetAmount, let selectedPlan):
            
            var p:[String : Any] = ["terminalCode":terminalCode, "storeCode": storeCode]
            
            if budgetAmount != nil{
                p["budgetAmount"] = budgetAmount!
                p["printerTypeName"] = "1003"
                p["printerStationType"] = "6"
                p["selectedBudgetPlan"] = selectedPlan
            }
            
            let bridgeCoreRequestDict:[String : Any] = ["operation":BridgeCoreOperationName.getBudget.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)

        case .returnSelect(let connectionId):
            let bridgeCoreRequestDict:[String : Any] = ["operation":BridgeCoreOperationName.returnSelect.rawValue, "params":"", "connectionId":connectionId]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            
            return(params, "", "")
            
        case .selectTransactionWithParams(let connectionId, let terminalCode, let storeCode, let parameters):
            let bridgeCoreRequestDict:[String : Any] = ["operation":BridgeCoreOperationName.selectTransaction.rawValue, "params":parameters, "connectionId":connectionId]
            
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            
            return(params, terminalCode, storeCode)
            
        case .addItem(let connectionId, let terminalCode, let storeCode, let parameters):
            
            let bridgeCoreRequestDict:[String : Any] = ["operation":BridgeCoreOperationName.addItem.rawValue, "params":parameters, "connectionId":connectionId]
            
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            
            return(params, terminalCode, storeCode)

        case .applyDiscount(let connectionId, let terminalCode, let storeCode, let parameters):
            let bridgeCoreRequestDict:[String : Any] = ["operation":BridgeCoreOperationName.applyDiscountToItem.rawValue, "params":parameters, "connectionId":connectionId]
            
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            
            return(params, terminalCode, storeCode)
            
        case .totalizeTransaction(let connectionId, let terminalCode, let storeCode, let parameters):
            let bridgeCoreRequestDict:Parameters = ["operation":BridgeCoreOperationName.totalizeTransaction.rawValue,
                                                    "params":parameters, "connectionId":connectionId]
            
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            
            return(params, terminalCode, storeCode)
            
        case .cardCancel(connectionId: let connectionId, operation: let operation, let terminalCode, let storeCode, let object):
            
            let p:[String : Any] = ["connectionId":connectionId, "operation": operation, "params": object]
            
            let bridgeCoreRequestDict:[String : Any] = ["operation":WithdrawalsOperation.useCreditCard.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
        case .addPurse(let connectionId, let terminalCode, let storeCode, let parameters):
            let bridgeCoreRequestDict:Parameters = ["operation":BridgeCoreOperationName.addMonederoPayment.rawValue,
                                                    "params":parameters, "connectionId":connectionId]
            
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            
            return(params, terminalCode, storeCode)
            
        case .finishTransactionWithParams(let connectionId, let terminalCode, let storeCode, let params):
            let p:Parameters = params
            
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":BridgeCoreOperationName.finishTransaction.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
            
            
        }
    }
}
