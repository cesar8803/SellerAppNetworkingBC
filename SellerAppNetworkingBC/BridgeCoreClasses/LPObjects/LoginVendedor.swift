//
//  LoginVendedor.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation

public class LoginVendedor /* : LPSalesCycleProtocol */ {
    
    public var employeeName: String = ""
    public var activity: String = ""
    
    init(mappable: Bridgecoreresponse?){
        
        guard let response = mappable else {
            return
        }
        
        // TODO: super.init(bridgeCoreResponse: bridgeCoreResponse)
        
        self.employeeName = response.representation?.sessionData?.userName ?? ""
        self.activity = response.actualActivity ?? ""
        
    }
    
}
