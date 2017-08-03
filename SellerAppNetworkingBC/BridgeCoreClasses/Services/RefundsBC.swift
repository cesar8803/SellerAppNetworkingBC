//
//  RefundsBC.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/25/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

public class RefundsBC
{
    public class func findItems(storeCode:String, terminalCode:String, itemCode:String, exactMaching:Bool, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
          let oper = BridgeCoreOperation.findItem(terminalCode: terminalCode, storeCode: storeCode, itemCode: itemCode, exactMaching: exactMaching)
        
        let (params, _, _) = oper.getParams()
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.findItem(parameters: params), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    
    public class func findItemsList(storeCode:String, terminalCode:String, itemsCodeList:[String], completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let oper = BridgeCoreOperation.findItemList(terminalCode: terminalCode, storeCode: storeCode, itemsCodeList: itemsCodeList)
        
        let (params, _, _) = oper.getParams()
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.findItemsList(parameters: params), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func addItem(connectionId:String, storeCode:String, terminalCode:String, item:BCRequestParams,  completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let oper = BridgeCoreOperation.addItem(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, params: item.getParamsForRequest())
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.addItem(operation: oper), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
        
    }
    
    public class func applyDiscountToItem(connectionId:String, storeCode:String, terminalCode:String, discountParams:BCRequestParams,  completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let oper = BridgeCoreOperation.applyDiscount(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, params: discountParams.getParamsForRequest())
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.addItem(operation: oper), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    

}
