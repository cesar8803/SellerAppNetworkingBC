//
//  Representation.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/5/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class RepresentationWD: Mappable{
    public var status: String?
    public var storeCode: String?
    public var terminalCode: Int?
    public var sessionData: SessionDataWD?
    public var logoffMessageOnExtDisplay: String?
    public var cashDrawerOpenAllowed: Int?
    public var frankingMode: Int?
    public var checkReadingRequired: Int?
    public var logonMessageOnExtDisplay: String?
    public var arrobaClass: String?
    public var firstCashLimitExceeded: Int?
    public var printMode: Int?
    public var storeCloseInProgress: Int?
    public var optionalForceKeys: Int?
    public var secondCashLimitExceeded: Int?
    public var additionalData: [AdditionalData]?
    public var fieldRequests: [FieldRequests]?
    public var storesList: [StoresList]?
    
    public var stores:[LPStoreData]? {
        
        if let storeDataList = self.storesList?.first?.storeData {
            
            return storeDataList.map({ (storeData) -> LPStoreData in
                let lp = LPStoreData(mappable: storeData)
                return lp
            })
        }else{
            return nil
        }
        
    }
    
    /****************************/
    /*      CloseTerminal      */

    public var totalsData: TotalsData?
    public var storeStatus: String?
    public var priceWithTaxes: Int?
    public var controllerID: String?
    public var assignedCashDrawer: Int?
    
    /****************************/
    
    
    public var autoCancelTrxAddCustomer: Int?
    public var warningList: [String]?
    public var warrantyMessage: String?
    public var warrantyList: [String]?
    public var warrantyListN: [Warrantylist]?
    public var storeCloseMessageExtDisplay: String?
    public var storeOpenMessageExtDisplay: String?
    public var aditionalParameters: [Aditionalparameters]?
    
    //MARK:- SimpleParameters for ConfirmCardPaymentRepresentation
    /**
    * authorizationCode: Codigo de autorización a enviar al pinpad en la confirmación en el campo “Authorization Code”
    */
    public var authorizationCode: String?
    /**
     * code: Codigo de respuesta para enviar al PinPad en la confirmación en el campo “Status de la respuesta del Host”
     */
    public var code: String?
    /**
     * baseScripts: Scripts completos
     */
    public var baseScripts: String?
    /**
     * authorization: Tipo de autorización
     */
    public var authorization: String?
    
    /**
    * tokenTlv91: Token de respuesta para enviar al PinPad en la confirmación en el campo “Issuer Authentication Data” (String (Base 64))
    */
    public var tokenTlv91: String?
    
    
    
    required public init?(map: Map){
    }
    
    public var forceKeysData: Forcekeysdata?
    
    public func mapping(map: Map){
        status <- map["status"]
        storeCode <- map["storeCode"]
        terminalCode <- map["terminalCode"]
        sessionData <- map["sessionData"]
        logoffMessageOnExtDisplay <- map["logoffMessageOnExtDisplay"]
        cashDrawerOpenAllowed <- map["cashDrawerOpenAllowed"]
        frankingMode <- map["frankingMode"]
        checkReadingRequired <- map["checkReadingRequired"]
        logonMessageOnExtDisplay <- map["logonMessageOnExtDisplay"]
        arrobaClass <- map["@class"]
        firstCashLimitExceeded <- map["firstCashLimitExceeded"]
        printMode <- map["printMode"]
        storeCloseInProgress <- map["storeCloseInProgress"]
        optionalForceKeys <- map["optionalForceKeys"]
        secondCashLimitExceeded <- map["secondCashLimitExceeded"]
        totalsData <- map["totalsData"]
        storeStatus <- map["storeStatus"]
        priceWithTaxes <- map["priceWithTaxes"]
        controllerID <- map["controllerID"]
        assignedCashDrawer <- map["assignedCashDrawer"]
        additionalData <- map["additionalData"]
        fieldRequests <- map["fieldRequests"]
        storesList <- map["storesList"]
        autoCancelTrxAddCustomer <- map["autoCancelTrxAddCustomer"]
        warningList <- map["warningList"]
        warrantyMessage <- map["warrantyMessage"]
        warrantyList <- map["warrantyList"]
        storeCloseMessageExtDisplay <- map["storeCloseMessageExtDisplay"]
        storeOpenMessageExtDisplay <- map["storeOpenMessageExtDisplay"]
        aditionalParameters <- map["aditionalParameters"]
        warrantyListN <- map["warrantyList"]
        additionalData <- map["additionalData"]
        fieldRequests <- map["fieldRequests"]
        baseScripts <- map["baseScripts"]
        authorization <- map["authorization"]
        fieldRequests <- map["fieldRequests"]
        tokenTlv91 <- map["tokenTlv91"]
        forceKeysData <- map["forceKeysData"]
        code <- map["code"]
        authorizationCode <- map["authorizationCode"]
    }
}
