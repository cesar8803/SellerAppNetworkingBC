//
//  LPBridgeCoreResponse.swift
//  BridgeCoreModule
//
//  Created by Alejandro Hernandez on 16/06/17.
//  Copyright © 2017 deloitte. All rights reserved.
//

import Foundation

public class LPBridgeCoreResponse {
    
    public var ack: Int = -99999
    public var message: String = ""
    public var connectionId: String = ""
    public var actualActivity: String = ""
    
    /* TO DO
     public var fieldRequestMessage: String = ""
     public var fieldRequestField: String = ""
     public var warrantiesLiverpoolRepresentation: Array<LPWarrantyLiverpoolRepresentation>? = []
     */
    
    init(mapplable: Bridgecoreresponse?) {
        
        guard let response = mapplable else {
            return
        }
        
        self.ack = response.ack ?? 0
        self.message = response.message ?? ""
        self.connectionId = response.connectionId ?? ""
        self.actualActivity = response.actualActivity ?? ""
        
        /* TO DO
        if let messageFieldRequest = bridgeCoreResponse["representation"]["fieldRequests"][0][LPBridgeCoreServiceResponseMapping.RequestData.rawValue]["message"] {
            self.fieldRequestMessage = messageFieldRequest as! String
        }
        else if let messageFieldRequest = bridgeCoreResponse["representation"]["fieldRequests"][0][LPBridgeCoreServiceResponseMapping.RequestData.rawValue][0]["message"].string{
            self.fieldRequestMessage = messageFieldRequest
        }
        if let fieldRequestField = bridgeCoreResponse["representation"]["fieldRequests"][0][LPBridgeCoreServiceResponseMapping.RequestData.rawValue]["field"].string {
            self.fieldRequestField = fieldRequestField
        }
        else if let fieldRequestField = bridgeCoreResponse["representation"]["fieldRequests"][0][LPBridgeCoreServiceResponseMapping.RequestData.rawValue][0]["field"].string {
            self.fieldRequestField = fieldRequestField
        }
        
        if let warrantiesLiverpoolRepresentation = bridgeCoreResponse["representation"]["exceptionsListData"][0]["warrantyLiverpoolRepresentation"].array {
            for warranty:JSON in warrantiesLiverpoolRepresentation {
                let warrantyLiverpool = LPWarrantyLiverpoolRepresentation.init(bridgeCoreResponse: warranty)
                self.warrantiesLiverpoolRepresentation?.append(warrantyLiverpool)
            }
        } else {
            //If there is only one, the response is a dictionary, instead of an array
            let warrantyLiverpool = bridgeCoreResponse["representation"]["exceptionsListData"][0]["warrantyLiverpoolRepresentation"]
            if warrantyLiverpool != nil {
                self.warrantiesLiverpoolRepresentation?.append(LPWarrantyLiverpoolRepresentation(bridgeCoreResponse: warrantyLiverpool))
            }
        }*/
        
    }
}
