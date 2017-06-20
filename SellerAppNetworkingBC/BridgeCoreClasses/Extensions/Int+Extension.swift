//
//  Int+Extension.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 15/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

extension Int {
    
    func toBool() -> Bool {
        
        switch self {
            
        case 1:
            return true
            
        case nil:
            return false
            
        default:
            return false
        }
        
    }
    
}
