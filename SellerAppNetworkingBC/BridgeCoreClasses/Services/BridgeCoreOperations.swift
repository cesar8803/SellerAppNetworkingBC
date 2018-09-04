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

public struct Item{
    public let itemPrice:String
    public let warrantySelected:Bool
    public let itemQty:String
    public let itemBarcode:String
    public let type:String
    public let itemDepartment:String
    public var somsDeliveryType:String?
    public var somsDeliveryDate:String?
    public var giffTicket:Bool?
    public var isCambioPrecio:Bool?
    
    public init(itemPrice: String, warrantySelected: Bool, itemQty: String, itemBarcode: String,itemDepartment: String, somsDeliveryType:String? = nil, somsDeliveryDate:String? = nil, giffTicket:Bool? = nil, isCambioPrecio:Bool? = nil)
    {
        self.itemPrice = itemPrice
        self.warrantySelected = warrantySelected
        self.itemQty = itemQty
        self.itemBarcode = itemBarcode
        self.itemDepartment = itemDepartment
        self.type = "map"
        //
        self.somsDeliveryType = somsDeliveryType
        self.somsDeliveryDate = somsDeliveryDate
        self.giffTicket = giffTicket
        self.isCambioPrecio = isCambioPrecio
    }
    
    public init(itemPrice: String, warrantySelected: Bool, itemQty: String, itemBarcode: String){
        self.itemPrice = itemPrice
        self.warrantySelected = warrantySelected
        self.itemQty = itemQty
        self.itemBarcode = itemBarcode
        self.itemDepartment = ""
        self.type = "map"
        self.somsDeliveryType = nil
        self.somsDeliveryDate = nil
    }
}

public enum BridgeCoreOperationName:String
{
    case selectEnableCoins = "selectEnableCoins"
    case selectTransaction = "selectTransaction"
    case addTender = "addTender"
    case finishTransaction = "finishTransaction"
    case finishTransactionPrinter = "finishTransactionPrinter"
    case cancelTransaction = "cancelTransaction"
    case findItems = "findItems"
    case findItemsList = "findItemsList"
    case getBudget = "calculateBudget"
    case returnSelect = "returnSelect"
    case addItem = "addItem"
    case giftItem = "giftItem"
    case applyDiscountToItem = "applyDiscountToItem"
    case totalizeTransaction = "totalizeTransaction"
    case addItemList = "addItemList"
    case addCardPayment = "addCardPayment"
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
    case isCambioPrecio = "isCambioPrecio"
    case sequenceNumber = "sequenceNumber"
    case discountType = "discountType"
    case discountValue = "discountValue"
    case giftItem = "giftItem"
    
    case promoOptionSelected = "promoOptionSelected"
    case supervisorEntryMethod = "supervisorEntryMethod"
    case supervisorPassword = "supervisorPassword"
    case supervisorName = "supervisorName"
    case mesaItemFestejado = "mesaItemFestejado"
    
    case paymentAmount = "paymentAmount"
    case account = "account"
    case paymentMethod = "paymentMethod"
    case entryMethod = "entryMethod"
    
    case warrantySelected = "warrantySelected"
    case type = "@type"
    case somsAccountNumber = "somsAccountNumber"
    case operationsToApprove = "operationsToApprove"
    
    case map = "@map"
    case itemsOptionSelected = "itemsOptionSelected"
    case sequence = "sequence"
    case optionsGroupsSelected = "optionsGroupsSelected"
    case optionGroup = "optionGroup"
    
    case somsDeliveryType = "somsDeliveryType"
    case somsDeliveryDate = "somsDeliveryDate"
}


//Mark:- New BCRequest parameters
/*
 * this is an additional way to build the request paraemters for BridgeCore. The correct number of parameters is
 * resposabilities who use it
 */
public typealias BCDictionary = [BCParamsNames:Any]

public protocol BCRequestProtocol{
    var parameters: BCDictionary  {get set}
    var terminal:String {get}
    var store:String {get}
    var connId:String {get}
    var operationName:BridgeCoreOperationName {get set}
    var transactionSubtype:BCTransactionSubtype? {get set}
}

public extension BCRequestProtocol{
    
    func getDictionayParams()->[String:Any] {
        var dict:[String:Any] = [String:Any]()
        for (key, value) in self.parameters{
            dict[key.rawValue] = value
        }
        if let sub = self.transactionSubtype{
            dict["transactionSubtype"] = sub.rawValue
        }
        return dict
    }
    
    mutating func addParameter(key:BCParamsNames, value:Any){
        self.parameters[key] = value
    }
    
    func getRequestParameters()->Parameters{
        var dict:Parameters = Parameters()
        dict["operation"] = self.operationName.rawValue
        dict["params"] = self.getDictionayParams()
        dict["connectionId"] = self.connId
        
        return dict
    }
}

//MARk:- BCRequest
/**
 * Use this structure to encapsule all logic of make the request dictionary
 */
public struct BCRequest:BCRequestProtocol{
    public var parameters: BCDictionary = BCDictionary()
    public let terminal:String
    public let store:String
    public let connId:String
    public var operationName:BridgeCoreOperationName
    public var transactionSubtype:BCTransactionSubtype?
    
    public init(parameters:BCDictionary, terminal:String, store:String, connId:String, operationName:BridgeCoreOperationName, transactionSubtype:BCTransactionSubtype?){
        self.parameters = parameters
        self.terminal = terminal
        self.store = store
        self.connId = connId
        self.operationName = operationName
        self.transactionSubtype = transactionSubtype
    }
}

//Mark:--


public enum BCRequestParams{
    case refundNormalTransaction(refundOriginalTrxScannedCode:String,
        transactionSubtype: String,
        refundOriginalEmployee:String,
        originalTrxStore:String,
        refundCause:Int,
        giftTicket:Bool,
        scannedCodeEntryMethod:String)
    
    case refundSomsTransaction(refundOriginalTrxScannedCode:String,
        transactionSubtype: String,
        refundOriginalEmployee:String,
        originalTrxStore:String,
        somsAccountNumber:String,
        refundCause:Int,
        giftTicket:Bool
    )
    
    case selectTransactionSupervisor(supervisorEntryMethod: String,
        refundOriginalTrxScannedCode:String,
        transactionSubtype: String,
        refundOriginalEmployee:String,
        originalTrxStore:String,
        supervisorName: String,
        refundCause:Int,
        giftTicket:Bool,
        operationsToApprove: String,
        supervisorPassword: String,
        somsAccountNumber: String
    )
    
    case additem(itemPrice:String,
        itemDepartment: String?,
        itemDepartmentPrice: String?,
        itemQty: String,
        itemBarcode: String,
        processPromotions:Bool,
        isCambioPrecio:Bool)
    
    case giftItem(sequenceNumber:Int,
        giftItem:Bool,
        itemBarcode:String)
    
    case applydiscount(
        processPromotions: Bool,
        sequenceNumber: Int,
        discountType: Int,
        discountValue: Double)
    
    
    
    case totalizeTransaction(processPromotions:Bool)
    
    
    case totalizeTransactionAutorized(
        supervisorEntryMethod:String,
        processPromotions:Bool,
        supervisorPassword:String,
        supervisorName:String)
    
    case addPurse(paymentAmount:String, account: String, paymentMethod:String, entryMethod: String)
    
    case addGenericItem(itemPrice:String,
        itemDepartment: String,
        itemDepartmentPrice: String,
        itemQty: String)
    
    case addItemList(product: Item)
    
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
            
        case .refundSomsTransaction(let refundOriginalTrxScannedCode,
                                    let transactionSubtype,
                                    let refundOriginalEmployee,
                                    let originalTrxStore,
                                    let somsAccountNumber,
                                    let refundCause,
                                    let giftTicket):
            
            let params:Parameters = [BCParamsNames.refundOriginalTrxScannedCode.rawValue:refundOriginalTrxScannedCode,
                                     BCParamsNames.transactionSubtype.rawValue: transactionSubtype,
                                     BCParamsNames.refundOriginalEmployee.rawValue:refundOriginalEmployee,
                                     BCParamsNames.originalTrxStore.rawValue: originalTrxStore,
                                     BCParamsNames.somsAccountNumber.rawValue: somsAccountNumber,
                                     BCParamsNames.refundCause.rawValue:refundCause,
                                     BCParamsNames.giftTicket.rawValue: giftTicket]
            return params
        case .selectTransactionSupervisor(let supervisorEntryMethod,
                                          let refundOriginalTrxScannedCode,
                                          let transactionSubtype,
                                          let refundOriginalEmployee,
                                          let originalTrxStore,
                                          let supervisorName,
                                          let refundCause,
                                          let giftTicket,
                                          let operationsToApprove,
                                          let supervisorPassword,
                                          let somsAccountNumber):
            
            let params: Parameters = [BCParamsNames.supervisorEntryMethod.rawValue:supervisorEntryMethod,
                                      BCParamsNames.refundOriginalTrxScannedCode.rawValue:refundOriginalTrxScannedCode,
                                      BCParamsNames.transactionSubtype.rawValue: transactionSubtype,
                                      BCParamsNames.refundOriginalEmployee.rawValue:refundOriginalEmployee,
                                      BCParamsNames.originalTrxStore.rawValue: originalTrxStore,
                                      BCParamsNames.supervisorName.rawValue:supervisorName,
                                      BCParamsNames.refundCause.rawValue:refundCause,
                                      BCParamsNames.giftTicket.rawValue: giftTicket,
                                      BCParamsNames.operationsToApprove.rawValue:operationsToApprove,
                                      BCParamsNames.supervisorPassword.rawValue:supervisorPassword,
                                      BCParamsNames.somsAccountNumber.rawValue:somsAccountNumber]
            return params
            
        case .additem(let itemPrice, let itemDepartment, let itemDepartmentPrice, let itemQty, let itemBarcode, let processPromotions, let isCambioPrecio):
            
            var params: Parameters = Parameters()
            
            if isCambioPrecio == false{
                params = [BCParamsNames.itemPrice.rawValue: itemPrice,
                          BCParamsNames.itemQty.rawValue:itemQty,
                          BCParamsNames.itemBarcode.rawValue:itemBarcode,
                          BCParamsNames.processPromotions.rawValue:processPromotions]
            }else{
                params = [BCParamsNames.itemPrice.rawValue: itemPrice,
                          BCParamsNames.itemQty.rawValue:itemQty,
                          BCParamsNames.itemBarcode.rawValue:itemBarcode,
                          BCParamsNames.processPromotions.rawValue:processPromotions,
                          BCParamsNames.isCambioPrecio.rawValue:isCambioPrecio]
            }
            
            if let itmDepartment = itemDepartment{
                params[BCParamsNames.itemDepartment.rawValue] = itmDepartment
            }
            
            if let itmDepartmentPrice = itemDepartmentPrice{
                params[BCParamsNames.itemDepartmentPrice.rawValue] = itmDepartmentPrice
            }
            
            
            return params
            
        case .giftItem(let sequenceNumber, let giftItem, let itemBarcode):
            let params: Parameters = [BCParamsNames.sequenceNumber.rawValue: sequenceNumber,
                                      BCParamsNames.giftItem.rawValue: giftItem,
                                      BCParamsNames.itemBarcode.rawValue: itemBarcode]
            
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
            
        case .totalizeTransactionAutorized(let supervisorEntryMethod, let processPromotions, let supervisorPassword, let supervisorName):
            
            let params: Parameters = [BCParamsNames.supervisorEntryMethod.rawValue:supervisorEntryMethod,
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
            
        case .addGenericItem(let itemPrice, let itemDepartment, let itemDepartmentPrice, let itemQty):
            let params: Parameters = [BCParamsNames.itemPrice.rawValue: itemPrice,
                                      BCParamsNames.itemDepartment.rawValue: itemDepartment,
                                      BCParamsNames.itemDepartmentPrice.rawValue: itemDepartmentPrice,
                                      BCParamsNames.itemQty.rawValue:itemQty]
            return params
        case .addItemList(let item):
            var params: Parameters = [
                BCParamsNames.type.rawValue : "map",
                BCParamsNames.itemBarcode.rawValue: item.itemBarcode,
                BCParamsNames.itemPrice.rawValue: item.itemPrice,
                BCParamsNames.warrantySelected.rawValue: item.warrantySelected,
                BCParamsNames.itemQty.rawValue: item.itemQty
            ]
            //
            //VALIDAR SI VIENE DELIVERY TYPE Y DELIVERY DATE
            if let somsDeliveryType = item.somsDeliveryType
            {
                params[BCParamsNames.somsDeliveryType.rawValue] = somsDeliveryType
            }
            //
            if let somsDeliveryDate = item.somsDeliveryDate
            {
                params[BCParamsNames.somsDeliveryDate.rawValue] = somsDeliveryDate
            }
            //
            return params
        }
    }
}


public typealias BCRequestDictionary = [BCParamsNames:Any]

public enum BridgeCoreOperation
{
    case selectTransaction(connectionId:String, terminalCode:String, storeCode:String,  transactionSubtype:BCTransactionSubtype, giftTicket:Bool)
    
    case addTender(connectionId:String, terminalCode:String, storeCode:String, paymentAmount: String,
        voidFalg: Bool,
        paymentMethod: String,
        paymentQuantity: String)
    
    case finishTransaction(connectionId:String, terminalCode:String, storeCode:String)
    
    case cancelTransaction(connectionId:String, terminalCode:String, storeCode:String)
    
    case cancelTransactionWithParams(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case cancelTransactionWithDocument(connectionId:String, terminalCode:String, storeCode:String, document:String, amount:String)
    
    case findItem( terminalCode:String, storeCode:String, itemCode:String,exactMaching:Bool)
    
    case findItemList( terminalCode:String, storeCode:String, itemsCodeList:[String])
    
    case getBudget( terminalCode: String, storeCode: String, budgetAmount: String?, selectedPlan: String?)
    
    case returnSelect(connectionId:String)
    
    //Generic Select Transaction
    // A generic function
    case selectTransactionWithParams(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case addItem(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case giftItem(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case applyDiscount(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case totalizeTransaction(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case cardCancel( connectionId: String, operation: String, terminalCode:String, storeCode:String, object:Any)
    
    case addPurse(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case finishTransactionWithParams(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case finishTransactionPrinter(connectionId:String, terminalCode:String, storeCode:String, params:Parameters)
    
    case addItemList(connectionId: String, terminal:String, store:String, params: [Parameters])
    
    case addCardPayment(connectionId: String, terminal:String, store:String, params: Parameters)
    
    case totalizeTransactionWithRequest(request:BCRequestProtocol)
    
    case addMonederoPayment(connectionId: String, terminal:String, store:String, params: Parameters)
    
    
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
            
        case .cancelTransactionWithParams(let connectionId, let terminalCode, let storeCode, let parameters):
            let bridgeCoreRequestDict:[String : Any] = ["operation":BridgeCoreOperationName.cancelTransaction.rawValue, "params":parameters, "connectionId":connectionId]
            
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            
            return(params, terminalCode, storeCode)
            
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
            
        case .giftItem(let connectionId, let terminalCode, let storeCode, let parameters):
            
            let bridgeCoreRequestDict:[String : Any] = ["operation":BridgeCoreOperationName.giftItem.rawValue, "params":parameters, "connectionId":connectionId]
            
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
            
        case .finishTransactionPrinter(let connectionId, let terminalCode, let storeCode, let params):
            let p:Parameters = params
            
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":BridgeCoreOperationName.finishTransactionPrinter.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
            
        case .addItemList(let connectionId, let terminal, let store, let params):
            
            let itemDataList = ["value":params]
            
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":BridgeCoreOperationName.addItemList.rawValue, "params":["itemDataList":itemDataList]]
            
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminal, store)
            
        case .addCardPayment(let connectionId, let terminal, let store, let params):
            
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":BridgeCoreOperationName.addCardPayment.rawValue, "params":params]
            
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminal, store)
            
            
        case .totalizeTransactionWithRequest(let request):
            let params:Parameters = ["bridgeCoreRequest":request.getRequestParameters()]
            
            return (params, request.terminal, request.store)
            
        case .addMonederoPayment(let connectionId, let terminal, let store, let params):
            
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":BridgeCoreOperationName.addMonederoPayment.rawValue, "params":params]
            
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminal, store)
            
            
        }
    }
}

