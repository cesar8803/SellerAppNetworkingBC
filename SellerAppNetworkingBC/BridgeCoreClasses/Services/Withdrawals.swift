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


public enum WithdrawalsOperation:String
{
    case selectEnableCoins = "selectEnableCoins"
    case selectTransaction = "selectTransaction"
}

public class Withdrawals
{
    public class func selectEnableCoins(connectionId:String, storeCode:String, terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let params = ["storeCode":storeCode, "terminalCode":terminalCode]
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"selectEnableCoins", "params":params] as [String : Any]
    
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        print(":UPDATED===>\(p)")
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.selectEnableCoins(parameters: p), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
        
        /*AsyncClientBC.putRequestExecute(BackendUrlManager.ServiceUrlsId.selectEnableCoins, parameters: p, viewLoader: true, msjLoader: "cargando", completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }*/
    }
    
    
   
    public class func selectTransaction(connectionId:String,
                                        storeCode:String,
                                        terminalCode:String,
                                        transactionSubtype:String,
                                        giftTicket:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let params = ["transactionSubtype":transactionSubtype, "giftTicket":giftTicket]
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":WithdrawalsOperation.selectTransaction.rawValue, "params":params] as [String : Any]
        
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.selectTransaction(terminalCode: terminalCode, storeCode: storeCode, paramters: p), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
        
        /*AsyncClientBC.putRequestExecute(BackendUrlManager.ServiceUrlsId.selectEnableCoins, parameters: p, viewLoader: true, msjLoader: "cargando", completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }*/
    }
    
    
}
