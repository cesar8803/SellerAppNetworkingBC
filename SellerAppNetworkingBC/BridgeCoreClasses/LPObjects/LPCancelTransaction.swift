//
//  LPCancelTransaction.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 20/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import UIKit

public class LPCancelTransaction /*: LPSalesCycleProtocol */ {

    public var bcResponse: LPBridgeCoreResponse!

    init(mappable: Bridgecoreresponse?) {
        
        guard let response = mappable else {
            return
        }
        
        self.bcResponse = LPBridgeCoreResponse(mapplable: response)
        
    }
    
}
