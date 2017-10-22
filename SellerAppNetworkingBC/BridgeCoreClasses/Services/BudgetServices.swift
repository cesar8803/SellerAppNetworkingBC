//
//  BudgetServices.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 27/07/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

public class BudgetServices{

    public class func generateBudget(forAmount amount: String?, withPlan plan: String?, _ terminalCode: String, _ storeCode: String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC){
    
        
        let oper = BridgeCoreOperation.getBudget(terminalCode: terminalCode, storeCode: storeCode, budgetAmount: amount, selectedPlan: plan)
        
        let (params, _, _) = oper.getParams()
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.generateBudget(parameters: params), completion: { (response) in
            completion(response)
        }, errorCompletition: { (error) in
            completionError(error)
        })
    }
}
