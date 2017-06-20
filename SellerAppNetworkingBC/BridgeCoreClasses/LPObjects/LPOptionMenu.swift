//
//  LPOptionMenu.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation

// This class holds a unique type of payments method
public class LPOptionMenu{
    
    public var optionNumber: Int = 0
    public var optionName: String = ""
    //public var extendedProperty: LPExtendedProperty?
    
    init(mapplable: Optionmenu?) {
        
        guard let response = mapplable else {
            return
        }
        
        self.optionNumber = response.optionNumber ?? 0
        self.optionName = response.optionName ?? ""
        
        /* TO DO
         if let extendedProperties = bridgeCoreResponse["extendedProperties"].array {
         self.extendedProperty = LPExtendedProperty(bridgeCoreResponse: extendedProperties[0])
         }
         */
    }
}

/* TO DO
public class LPExtendedProperty
{
    public var foreignCurrency: String = ""
    public var foreignQuoteFactor: Int = 0
    public var cardAccountRequired: Bool? = false
    
    init(bridgeCoreResponse: JSON) {
        if let foreignCurrency = bridgeCoreResponse["foreignCurrency"].string {
            self.foreignCurrency = foreignCurrency
        }
        if let foreignQuoteFactor = bridgeCoreResponse["foreignQuoteFactor"].int {
            self.foreignQuoteFactor = foreignQuoteFactor
        }
        if let cardAccountRequired = bridgeCoreResponse["cardAccountRequired"].bool {
            self.cardAccountRequired = cardAccountRequired
        }
    }
}
*/
