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
    public var string: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        if let _ = map["string"].currentValue as? [String]{
            stringArray <- map["string"]
        }else{
            string <- map["string"]
        }
    }
}
