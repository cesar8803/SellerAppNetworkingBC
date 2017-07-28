//
//  PrinterDocument.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 27/07/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class PrinterDocument: Mappable{
    public var errorDescription: String?
    public var printerDocumentsBase64: [PrinterDocumentsBase64]?
    public var errorCode: Int?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        errorDescription <- map["errorDescription"]
        printerDocumentsBase64 <- map["printerDocumentsBase64"]
        errorCode <- map["errorCode"]
    }
}
