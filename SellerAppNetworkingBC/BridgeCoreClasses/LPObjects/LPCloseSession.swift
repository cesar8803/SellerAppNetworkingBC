//
//  LPCloseSession.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation

public class LPCloseSession{
    
    public var bcResponse: LPBridgeCoreResponse!
    
    init(mappable: Bridgecoreresponse?) {
        
        guard let response = mappable else {
            return
        }
        
        self.bcResponse = LPBridgeCoreResponse(mapplable: response)
        
    }
    
}
