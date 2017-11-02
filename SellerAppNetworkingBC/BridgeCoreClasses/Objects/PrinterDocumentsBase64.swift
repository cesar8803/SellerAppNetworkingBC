//
//  PrinterDocumentsBase64.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 27/07/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class PrinterDocumentsBase64: Mappable{
    public var stringArray: [String]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        if let _ = map["string"].currentValue as? [String]{
            stringArray <- map["string"]
        }else{
            self.stringArray = [String]()
            var stringBase64: String? = nil
            stringBase64 <- map["string"]
            if let str = stringBase64{
                self.stringArray?.append(str)
            }
        }
    }
}
