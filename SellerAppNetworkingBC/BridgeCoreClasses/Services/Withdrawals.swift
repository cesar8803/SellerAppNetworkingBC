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



public enum WithdrawalsOperation:String
{
    case selectEnableCoins = "selectEnableCoins"
    case selectTransaction = "selectTransaction"
    case addTender = "addTender"
    case finishTransaction = "finishTransaction"
    case cancelTransaction = "cancelTransaction"
    case findItems = "findItems"
    case findItemsList = "findItemsList"
    case getBudget = "calculateBudget"
    case useCreditCard = "cancelCard"
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
