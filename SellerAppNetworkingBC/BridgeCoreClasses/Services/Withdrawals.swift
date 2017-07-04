//
//  Withdrawals.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/3/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import Alamofire

public class Withdrawals
{
    public class func selectEnableCoins(connectionId:String, storeCode:String, terminalCode:String)
    {
        let params = ["storeCode":storeCode, "terminalCode":terminalCode]
        let bridgeCoreRequestDict = ["conectionId":connectionId, "operation":"selectEnableCoins", "params":params] as [String : Any]
    
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        /*AsyncClientBC.putRequestExecute(BackendUrlManager.ServiceUrlsId.selectEnableCoins, _Parameters: p, _ViewLoader: false, _MsjLoader: "message", _Completion: { (brigeCoreResponse) in
            
        }) { (msg) in
            
        }*/
    }
}
