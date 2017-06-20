//
//  LPStartupSession.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation

public class LPStartupSession {
    
    public var terminalRepresentation: LPTerminalRepresentation!
    public var saleReturnOptions: [LPOptionMenu] = []
    public var stores: [LPStoreData] = []
    public var version: String = ""
    public var needsKeysUpdate: Bool = false
    public var connectionId: String = ""
    
    init(mappable: Bridgecoreresponse?) {
        
        guard let response = mappable, let representation = response.representation else {
            return
        }
        
        // ***** Terminal Representation ***** //
        
        self.terminalRepresentation = LPTerminalRepresentation(mappableResponse: representation)
        
        
        // ***** Options ***** //
        
        if let optionMenuList = representation.reasonSaleReturnMenu?.options?.first?.optionMenu {
            
            var options: [LPOptionMenu] = []
            
            for option in optionMenuList {
                let lpOption = LPOptionMenu(mapplable: option)
                options.append(lpOption)
            }
            
            self.saleReturnOptions = options
            
        }
        
        
        // ***** Stores ***** //
        
        if let storeDataList = representation.storesList?.first?.storeData {
            
            var stores: [LPStoreData] = []
            
            for store in storeDataList {
                let lpStore = LPStoreData(mappable: store)
                stores.append(lpStore)
            }
            
            self.stores = stores
            
        }
        
        self.connectionId = response.connectionId ?? ""
        self.version = response.version ?? ""
        self.needsKeysUpdate = representation.optionalForceKeys?.toBool() ?? false
        
    }
    
}
