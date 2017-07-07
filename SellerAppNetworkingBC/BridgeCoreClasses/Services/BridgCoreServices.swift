//
//  BridgCoreServices.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/7/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import Alamofire

public class BridgeCoreServices
{
    public class func logoff(connectionId:String, storeCode:String, terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        //let params = ["storeCode":storeCode, "terminalCode":terminalCode]
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"logoff"] as [String : Any]
        
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        
    
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.logoff(terminalCode: terminalCode, storeCode: storeCode, paramters: p), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func logIn(connectionId:String, storeCode:String, terminalCode:String, userName:String, userPassword:String, trainingMode:Bool, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let params:Parameters = ["userName":userName, "userPassword":userPassword, "trainingMode":trainingMode]
        
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"logoff", "params":params] as [String : Any]
        
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        

        let bcRouter = BrigdeCoreRouter.login(terminalCode: terminalCode, storeCode: storeCode, paramters: p)
        AsyncClientBC.getBCRequest(bcRouter: bcRouter, completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    

}
