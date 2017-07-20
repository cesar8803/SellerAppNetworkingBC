//
//  Withdrawals.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/3/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

public typealias ErrorStringHandlerBC = (_ errorString:String) -> Void

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
    
    func getParams()->(Parameters, String, String)
    {
        switch self
        {
        case .selectTransaction(let connectionId, let terminalCode, let storeCode , let transactionSubtype, let giftTicket):
            let p:[String:Any] = ["transactionSubtype":transactionSubtype.rawValue, "giftTicket": giftTicket]
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":WithdrawalsOperation.selectTransaction.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
            
        case .addTender(let connectionId, let terminalCode,let  storeCode, let paymentAmount, let voidFalg, let paymentMethod, let paymentQuantity):
            let p:[String:Any] = ["paymentAmount": paymentAmount,
                                  "voidFalg": voidFalg,
                                  "paymentMethod": paymentMethod,
                                  "paymentQuantity": paymentQuantity]
            
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":WithdrawalsOperation.addTender.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
            
        case .finishTransaction(let connectionId, let terminalCode,let  storeCode):
            let p:[String:Any] = [String:Any]()
            
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":WithdrawalsOperation.finishTransaction.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
            
        case .cancelTransaction(let connectionId, let terminalCode,let  storeCode):
            let p:[String:Any] = [String:Any]()
            
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":WithdrawalsOperation.cancelTransaction.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)

        case .cancelTransactionWithDocument(let connectionId, let terminalCode, let storeCode, let document, let amount):
            let p:[String:Any] = ["transactionSubtype":BCTransactionSubtype.CANCEL_TRANSACTION.rawValue, "amountTrxCancel": amount, "numTrxCancel":document]
            let bridgeCoreRequestDict:[String : Any] = ["connectionId":connectionId, "operation":WithdrawalsOperation.selectTransaction.rawValue, "params":p]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            return (params, terminalCode, storeCode)
        }
    }
}


public enum WithdrawalsOperation:String
{
    case selectEnableCoins = "selectEnableCoins"
    case selectTransaction = "selectTransaction"
    case addTender = "addTender"
    case finishTransaction = "finishTransaction"
    case cancelTransaction = "cancelTransaction"
}

public class Withdrawals
{
    
    public class func selectEnableCoins(connectionId:String, storeCode:String, terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let params = ["storeCode":storeCode, "terminalCode":terminalCode]
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"selectEnableCoins", "params":params] as [String : Any]
    
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.selectEnableCoins(parameters: p), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    
    public class func bridgeCoreOperationTransact(operation:BridgeCoreOperation, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let (params, terminalCode, storeCode) = operation.getParams()
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.selectTransaction(terminalCode: terminalCode, storeCode: storeCode, paramters: params), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    
    
    
}
