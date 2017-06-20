//
//  LPRegisterTerminal.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation

public class LPRegisterTerminal /*: LPSalesCycleProtocol */{
    
    public var ack: Int? = -99999
    public var message: String = ""
    
    init(mappable: Bridgecoreresponse?){
        
        guard let response = mappable else {
            return
        }
        
        // TODO: super.init(bridgeCoreResponse: bridgeCoreResponse)
        
        self.ack = response.ack ?? 99999
        self.message = response.message ?? ""
        
    }
    
}
