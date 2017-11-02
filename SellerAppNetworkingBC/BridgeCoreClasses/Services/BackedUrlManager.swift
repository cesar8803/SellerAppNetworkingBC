//
//  BackedUrlManager.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/3/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import Alamofire

/*
 class BackendUrlManager : NSObject{
 
 enum ServiceUrlsId : Int {
 case selectEnableCoins
 }
 
 fileprivate static let SERVICE_CONTEXT:[String] = [
 "bridge-server-rest-liverpool/service/selectEnableCoins",                                  //selectEnableCoins
 ]
 
 // The array of all the services url's.
 fileprivate var serviceUrls:[String] = [String]();
 
 fileprivate func createUrls() {
 //let backendHost = "172.22.209.218:9090/"
 //let backendProtocol = "http://"
 let servicesCount = BackendUrlManager.SERVICE_CONTEXT.count
 for index in 0..<servicesCount {
 let nextUrl:String = BridgeCoreConnection.sharedInstance.urlString //"\(backendProtocol)\(backendHost)\(BackendUrlManager.SERVICE_CONTEXT[index])";
 serviceUrls.append(nextUrl)
 }
 }
 
 
 // Gets the indicated service url.
 func getUrl(_ urlId:ServiceUrlsId) -> String {
 
 let selectedUrl:String = serviceUrls[urlId.rawValue]
 return selectedUrl
 }
 
 // Private init to avoid several instances of this class.
 fileprivate override init() {
 super.init()
 self.createUrls()
 //overrideUrls()
 }
 
 // Singleton intance.
 static let Current:BackendUrlManager = BackendUrlManager()
 }
 */

public enum BrigdeCoreRouter:URLRequestConvertible {
    
    /**
     * Very important!!: This property must be changed from the outside to get the correct connection of Bridgecore services. Otherwise it will be assigned by default the IP 49.66
     */

    static public var baseURLString = "http://172.22.49.66:9090"
    
    //Cases
    case selectEnableCoins(parameters:Parameters)
    case selectTransaction(terminalCode:String, storeCode:String, paramters:Parameters)
    case logoff(terminalCode:String, storeCode:String, parameters:Parameters)
    case login(terminalCode:String, storeCode:String, parameters:Parameters)
    case cancelTransaction(terminalCode:String, storeCode:String, parameters:Parameters)
    case findItem(parameters:Parameters)
    case findItemsList(parameters:Parameters)
    case generateBudget(parameters:Parameters)
    case returnSelect(terminalCode:String, storeCode:String, operation:BridgeCoreOperation)
    case selectTransactionWithOperation(terminalCode:String, storeCode:String, operation:BridgeCoreOperation)
    case addItem(operation:BridgeCoreOperation)
    case totalizeTransaction(operation:BridgeCoreOperation)
    case useCardPayment(terminalCode:String, storeCode:String, paramters:Parameters)
    case addPurse(operation:BridgeCoreOperation)
    case closeSession(terminalCode:String, storeCode:String)
    case startupSession(terminalCode:String, storeCode:String)
    case findWalletBalance(terminalCode:String, storeCode:String, paramters:Parameters)
    case addItemList(operation:BridgeCoreOperation)
    case updatePinPadKeys(parameters:Parameters)
    case promotionMapVersion(parameters:Parameters)
    case addCashPayment(terminalCode:String, storeCode:String, paramters:Parameters)
    case addCardPayment(operation: BridgeCoreOperation)
    case applyDiscount(terminalCode:String, storeCode:String, paramters:Parameters)
    case addMonederoPayment(operation: BridgeCoreOperation)
    case configureTerminal(paramters:Parameters)
    
    
    //method
    var method:HTTPMethod{
        switch self {
        case .selectEnableCoins(_):
            return .put
        case .selectTransaction(_,_,_):
            return .put
        case .logoff(_, _, _):
            return .put
        case .login(_,_,_):
            return .put
        case .cancelTransaction(_,_,_):
            return .put
        case .findItem(_):
            return .put
        case .findItemsList(_):
            return .put
        case .generateBudget(_):
            return .put
        case .returnSelect(_):
            return .put
        case .selectTransactionWithOperation(_, _, _):
            return .put
        case .addItem(_):
            return .put
        case .totalizeTransaction(_):
            return .put
        case .useCardPayment(_,_,_):
            return .put
        case .addPurse(_):
            return .put
        case .closeSession(_, _):
            return .delete
        case .startupSession(_, _):
            return .post
        case .findWalletBalance(_,_,_):
            return .put
        case .addItemList(_):
            return .put
        case .updatePinPadKeys(_):
            return .put
        case .promotionMapVersion(_):
            return .put
        case .addCashPayment(_,_,_):
            return .put
        case .addCardPayment(_):
            return .put
        case .applyDiscount(_,_,_):
            return .put
        case .addMonederoPayment(_):
            return .put
        case .configureTerminal(_):
            return .put
        }
        
    }
    
    var path:String{
        switch self {
        case .selectEnableCoins:
            return "bridge-server-rest-liverpool/service/selectEnableCoins"
        case .selectTransaction(let terminal, let store, _):
            return "bridge-server-rest-liverpool/terminal/\(terminal)/\(store)"
        case .logoff(let terminal, let store, _):
            return "bridge-server-rest-liverpool/terminal/\(terminal)/\(store)"
        case .login(let terminal, let store, _):
            return "bridge-server-rest-liverpool/terminal/\(terminal)/\(store)"
        case .cancelTransaction(let terminal, let store, _):
            return "bridge-server-rest-liverpool/terminal/\(terminal)/\(store)"
        case .findItem(_):
            return "bridge-server-rest-liverpool/service/findItems"
        case .findItemsList(_):
            return "bridge-server-rest-liverpool/service/findItemsList"
        case .generateBudget(_):
            return "bridge-server-rest-liverpool/service/findBudget"
        case .returnSelect(let terminal, let store, _):
            return pathForTerminalAndStore(terminalCode: terminal, storeCode: store)
        case .selectTransactionWithOperation(let terminal, let store, _):
            return pathForTerminalAndStore(terminalCode: terminal, storeCode: store)
        case .addItem(let operation):
            let  (_, terminal, store) = operation.getParams()
            return pathForTerminalAndStore(terminalCode: terminal, storeCode: store)
        case .totalizeTransaction(let operation):
            let  (_, terminal, store) = operation.getParams()
            return pathForTerminalAndStore(terminalCode: terminal, storeCode: store)
        case .useCardPayment(let terminal, let store, _):
            return "bridge-server-rest-liverpool/terminal/\(terminal)/\(store)"
        case .addPurse(let operation):
            let  (_, terminal, store) = operation.getParams()
            return pathForTerminalAndStore(terminalCode: terminal, storeCode: store)
        case .closeSession(let terminalCode, let storeCode):
            return pathForTerminalAndStore(terminalCode: terminalCode, storeCode: storeCode)
        case .startupSession(let terminalCode, let storeCode):
            return pathForTerminalAndStore(terminalCode: terminalCode, storeCode: storeCode) + "/1"
        case .findWalletBalance(_, _, _):
            return "bridge-server-rest-liverpool/service/findBalance"
        case .addItemList(let operation):
            let  (_, terminal, store) = operation.getParams()
            return pathForTerminalAndStore(terminalCode: terminal, storeCode: store)
        case .updatePinPadKeys(_):
            return pathForBaseServices() + "forceKeys"
        case .promotionMapVersion( _):
            return pathForBaseServices() + "terminalReport"
        case .addCashPayment(let terminal, let store, _):
            return "bridge-server-rest-liverpool/terminal/\(terminal)/\(store)"
        case .addCardPayment(let operation):
            let  (_, terminal, store) = operation.getParams()
            return pathForTerminalAndStore(terminalCode: terminal, storeCode: store)
        case .applyDiscount(let terminal, let store, _):
            return "bridge-server-rest-liverpool/terminal/\(terminal)/\(store)"
        case .addMonederoPayment(let operation):
            let  (_, terminal, store) = operation.getParams()
            return pathForTerminalAndStore(terminalCode: terminal, storeCode: store)
        case .configureTerminal(_):
            return "bridge-server-rest-liverpool/service/configureTerminal"
        }
    }
    
    func pathForTerminalAndStore(terminalCode:String, storeCode:String)->String{
        return "bridge-server-rest-liverpool/terminal/\(terminalCode)/\(storeCode)"
    }
    
    func pathForBaseServices()->String{
        return "bridge-server-rest-liverpool/service/"
    }
    
    
    public func asURLRequest() throws -> URLRequest
    {
        let url = try BrigdeCoreRouter.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .selectEnableCoins(let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .selectTransaction(_, _,  let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .logoff(_, _, let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .login(_, _, let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .cancelTransaction(_,_,let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .findItem(let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .findItemsList(let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .generateBudget(let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .returnSelect(_, _, let oper):
            let (params,_,_) = oper.getParams()
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .selectTransactionWithOperation(_, _, let operation):
            let (params,_,_) = operation.getParams()
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .addItem(let operation):
            let (params,_,_) = operation.getParams()
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .totalizeTransaction(let operation):
            let (params,_,_) = operation.getParams()
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .useCardPayment(_, _, let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .addPurse(let oper):
            let (params,_,_) = oper.getParams()
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .closeSession(_, _),
             .startupSession(_, _): break
        case .findWalletBalance(_,_,let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .addItemList(let oper):
            let (params,_,_) = oper.getParams()
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .updatePinPadKeys(let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .promotionMapVersion(let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .addCashPayment(_, _,  let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .addCardPayment(let oper):
            let (params,_,_) = oper.getParams()
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .applyDiscount(_, _,  let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .addMonederoPayment(let oper):
            let (params,_,_) = oper.getParams()
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .configureTerminal(let params):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        }
        
        
        return urlRequest
    }
}

