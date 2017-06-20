//
//  LPStoreData.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation

public class LPStoreData {
    
    public var description: String = ""
    public var storeCode: String = ""
    public var id: Int = 0
    public var storeType: String?
    public var storeSubType: String?
    public var longDescription: String?
    
    init(mappable: Storedata?) {
        
        guard let response = mappable else {
            return
        }
        
        self.description = response.description ?? ""
        self.storeCode = response.storeCode ?? ""
        self.id = response.id ?? 0
        self.storeType = response.storeType ?? ""
        self.storeSubType = response.storeSubType ?? ""
        self.longDescription = response.longDescription ?? ""
    }
    
}
