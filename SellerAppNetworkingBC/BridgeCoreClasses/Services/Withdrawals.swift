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


public class Withdrawals
{
    public class func selectEnableCoins(connectionId:String, storeCode:String, terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let params = ["storeCode":storeCode, "terminalCode":terminalCode]
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"selectEnableCoins", "params":params] as [String : Any]
    
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        print("p-->\(p)")
        
        AsyncClientBC.putRequestExecute(BackendUrlManager.ServiceUrlsId.selectEnableCoins, parameters: p, viewLoader: true, msjLoader: "cargando", completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    
    
}
