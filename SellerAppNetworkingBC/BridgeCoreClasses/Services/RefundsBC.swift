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
        
        let (params, terminalCode, storeCode) = oper.getParams()
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.findItem(parameters: params), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }

}
