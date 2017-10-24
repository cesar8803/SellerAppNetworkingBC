//
//  AsyncClientBC.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/3/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import PromiseKit

public class AsyncClientBC
{
    
    class func getBCRequest<T:Mappable>(bcRouter:BrigdeCoreRouter) -> Promise<T> {
        return Promise { fulfill, reject in
            let manager = Alamofire.SessionManager.default
            manager.session.configuration.timeoutIntervalForRequest = 0
            manager.session.configuration.timeoutIntervalForResource = 0
            manager.request(bcRouter).responseObject { (response: DataResponse<T>) in
                if response.result.isSuccess{
                    let responseService = response.result.value
                    fulfill(responseService!)
                } else {
                    reject(response.error!)
                }
            }
        }
    }
  
    class func getBCRequest<T:Mappable>(bcRouter:BrigdeCoreRouter, completion:@escaping (_ dataResponse:T) -> Void, errorCompletition: @escaping (_ errorString:String) -> Void)
    {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 0
        manager.session.configuration.timeoutIntervalForResource = 0
        manager.request(bcRouter).responseObject { (response: DataResponse<T>) in
            
            if response.result.isSuccess{
                let responseService = response.result.value
                completion(responseService!)
            } else {
                errorCompletition((response.result.error?.localizedDescription)!)
            }
        }
    }
    
}
