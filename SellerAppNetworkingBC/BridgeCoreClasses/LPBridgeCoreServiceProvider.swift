//
//  LPBridgeCoreServiceProvider.swift
//  BridgeCoreProject
//
//  Created by Alejandro Hernandez on 13/06/17.
//  Copyright © 2017 Alejandro Hernandez. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

public class LPBridgeCoreServiceProvider {
    
    // MARK: - PROPERTIES
    
    // ***** Session manager ***** //
    
    var manager: SessionManager = SessionManager()
    
    // ***** Printers ***** //
    
    var printerTypeName: String = "1003"
    var printerStationType: String = "6"

    // ***** End points ***** //

    open var endPointString: String = ""
    open var customRootEndpoint: String = ""
    open var environment: Environment = .qa
    
    open var rootEndpoint: String {
        switch self.environment {
            case .development:      return "http://172.22.70.40:9090/bridge-server-rest-liverpool/terminal"
            case .qa:               return "http://172.22.209.88:9090/bridge-server-rest-liverpool/terminal"
            case .custom:           return "\(self.customRootEndpoint)/bridge-server-rest-liverpool/terminal"
        }
    }
    
    // This path will be used to perform those operations that can be called at any moment without being in a specific activity.
    // Eg Operations: findItems, findCustomerCardBalance, calculateBudget, forceKeys, findPuntosBancomerBalance
    
    open var staticEndpoint: String {
        switch self.environment {
            case .development:      return "http://172.22.70.40:9090/bridge-server-rest-liverpool/service"
            case .qa:               return "http://172.22.209.88:9090/bridge-server-rest-liverpool/service"
            case .custom:           return "\(self.customRootEndpoint)/bridge-server-rest-liverpool/service"
        }
    }
    
    // ***** Connection id ***** //
    
    open var connectionId: String = "" {
        didSet {
            if self.connectionId == "" {
                print("*** RESETING Connection ***")
            }
        }
    }
    
    
    // MARK: - INITIALIZER
    
    public init(environment: Environment = .development, customRootEndpoint: String = ""){
        self.environment = environment
        self.customRootEndpoint = customRootEndpoint
        self.manager.session.configuration.httpAdditionalHeaders = LPBridgeCoreServiceProvider.defaultHeaders()
        self.manager.session.configuration.timeoutIntervalForRequest = 300
        #if ENV_DD_DEV
            self.manager.session.configuration.timeoutIntervalForRequest = 500
        #endif
    }
    
    
    // MARK: - GENERAL METHODS
    
    // MARK: Headers
    
    class func defaultHeaders() -> [String : String] {
        return [
            "Content-Type" : "application/json",
            "Accept" : "application/json",
            "Connection" : "keep-alive"
        ]
    }
    
    // MARK: Generate end point
    
    func setupEndpoint(withTerminal terminalCode: String = "", store storeCode: String = "") -> String {
        let completeURL = "\(rootEndpoint)/\(terminalCode)/\(storeCode)"
        if let safeURL = completeURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            return safeURL
        }
        return completeURL
    }
    
    
    // MARK: - SERVICES
    
    // MARK: Sessions
    
    public func startupSession(terminalCode: String, storeCode: String, completion: @escaping (LPStartupSession?, NSError?) -> ()) {
        
        let endPoint = setupEndpoint(withTerminal: terminalCode, store: storeCode)
        self.endPointString = endPoint
        
        let startupEndPoint = endPoint + "/1"
        
        self.manager.request(startupEndPoint, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { [weak weakSelf = self] (response) in
            
            guard let responseTuple = weakSelf?.responseProcessing(response: response) else {
                let error = NSError(domain: "No fue posible procesar la respuesta (Startup-Session)", code: -99999, userInfo: nil)
                completion(nil, error)
                return
            }
            
            // ***** Request successfuly ***** //
            
            let lpStartupSession = LPStartupSession(mappable: responseTuple.mapObj)
            
            self.connectionId = lpStartupSession.connectionId
            
            completion(lpStartupSession, responseTuple.error)
            
        }
        
    }
    
    public func closeSession(terminalCode: String, storeCode: String, completion: @escaping (LPCloseSession?, NSError?) -> ()) {
        
        let endPoint = setupEndpoint(withTerminal: terminalCode, store: storeCode)
        
        self.manager.request(endPoint, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { [weak weakSelf = self] (response) in
            
            guard let responseTuple = weakSelf?.responseProcessing(response: response) else {
                let error = NSError(domain: "No fue posible procesar la respuesta (Close-Session)", code: -99999, userInfo: nil)
                completion(nil, error)
                return
            }
            
            // ***** Request successfuly ***** //
            
            completion(LPCloseSession(mappable: responseTuple.mapObj), responseTuple.error)
            
        }
        
    }
    
    
    public func loginVendedor(username: String, password: String, trainingMode: Bool = false, completion: @escaping (LoginVendedor?, NSError?) ->()) {
        
        // ***** Parameters ***** //
        
        let parameters = [
            LPBridgeCoreServiceRequestMapping.BridgeCore.rawValue : [
                "connectionId" : self.connectionId,
                "operation" : "login",
                "params" : [
                    "userName" : username,
                    "userPassword" : password,
                    "trainingMode" : trainingMode
                ]
            ]
        ]
        
        
        self.manager.request(self.endPointString, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseData { [weak weakSelf = self]  (response) in
            
            guard let responseTuple = weakSelf?.responseProcessing(response: response) else {
                let error = NSError(domain: "No fue posible procesar la respuesta (Log-In)", code: -99999, userInfo: nil)
                completion(nil, error)
                return
            }
            
            // ***** Request successfuly ***** //
            
            completion(LoginVendedor(mappable: responseTuple.mapObj), responseTuple.error)
            
        }
        
    }

    
    public func logoutVendedor(completion: @escaping (Bool, NSError?) -> ()) {
        
        // ***** Parameters ***** //
        
        let parameters = [
            LPBridgeCoreServiceRequestMapping.BridgeCore.rawValue : [
                "connectionId" : connectionId,
                "operation" : "logoff"
            ]
        ]
        
        self.manager.request(self.endPointString, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseData { [weak weakSelf = self]  (response) in
            
            guard let responseTuple = weakSelf?.responseProcessing(response: response) else {
                let error = NSError(domain: "No fue posible procesar la respuesta (Log-Off)", code: -99999, userInfo: nil)
                completion(false, error)
                return
            }
            
            // ***** Request successfuly ***** //
            
            let status = (responseTuple.error == nil)
            
            completion(status, responseTuple.error)
            
        }
        
    }

    
    public func registerTerminal(terminalCode: String, storeCode: String, enablingTerminal:Bool, completion: @escaping (LPRegisterTerminal?, NSError?) ->()) {
        
        // ***** Parameter ***** //
        
        let parameters = [
            LPBridgeCoreServiceRequestMapping.BridgeCore.rawValue : [
                "operation" : "configureTerminal",
                "params" : [
                    "terminalCode" : terminalCode,
                    "storeCode" : storeCode,
                    "enablingTerminal" : enablingTerminal
                ]
            ]
        ]
        
        let endPoint = self.customRootEndpoint + "/bridge-server-rest-liverpool/service/configureTerminal"
        
        self.manager.request(endPoint, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseData { [weak weakSelf = self]  (response) in
            
            guard let responseTuple = weakSelf?.responseProcessing(response: response) else {
                let error = NSError(domain: "No fue posible procesar la respuesta (Register-Terminal)", code: -99999, userInfo: nil)
                completion(nil, error)
                return
            }
            
            // ***** Request successfuly ***** //
            
            completion(LPRegisterTerminal(mappable: responseTuple.mapObj), responseTuple.error)
            
        }

    }


    // MARK: Transactions
    
    public func cancelTransaction(cancelReasonCode: String = "", completion: @escaping (LPCancelTransaction?, NSError?) ->()) {
        
        let parameters = [
            LPBridgeCoreServiceRequestMapping.BridgeCore.rawValue: [
                "connectionId": connectionId,
                "operation": "cancelTransaction",
                "params": [
                    "cancelReasonCode": cancelReasonCode
                ]
            ]
        ]
        
        self.manager.request(self.endPointString, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseData { [weak weakSelf = self]  (response) in
            
            guard let responseTuple = weakSelf?.responseProcessing(response: response) else {
                let error = NSError(domain: "No fue posible procesar la respuesta (Register-Terminal)", code: -99999, userInfo: nil)
                completion(nil, error)
                return
            }
        
            // ***** Request successfuly ***** //
            
            completion(LPCancelTransaction(mappable: responseTuple.mapObj), responseTuple.error)

        }
    
    }

    
        
    // MARK: Processing response
    
    func responseProcessing(response: DataResponse<Data>) -> (mapObj: Bridgecoreresponse?, error: NSError?) {
        
        switch response.result {
            
            case .success(let responseData):
                
                do {
                    
                    let jsonValue = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : Any]

                    guard let bc3Mappable = BCResponse(JSON: jsonValue)?.bridgeCoreResponse else {
                        let mappableError = NSError(domain: "No se pudo mappear la respuesta", code: 9999, userInfo: nil)
                        return (nil, mappableError)
                    }
                    
                    let bc3Response = LPBridgeCoreResponse(mapplable: bc3Mappable)
                    
                    if bc3Response.ack != 0 {
                        let errorAck = NSError(domain: bc3Response.message, code: bc3Response.ack, userInfo: nil)
                        return (nil, errorAck)
                    }
                    
                    return (bc3Mappable, nil)
                
                }
                catch {
                    
                    let jsonError = error as NSError
                    return (nil, jsonError)
                }
            
            case .failure(let error):
                let responseError = error as NSError
                return (nil, responseError)
            
        }
        
    }
    
    
    
}
