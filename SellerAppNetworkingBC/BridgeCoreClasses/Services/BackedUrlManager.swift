//
//  BackedUrlManager.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/3/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import Alamofire

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
        let backendHost = "172.22.209.88:9090/"
        let backendProtocol = "http://"
        let servicesCount = BackendUrlManager.SERVICE_CONTEXT.count
        for index in 0..<servicesCount {
            let nextUrl:String = "\(backendProtocol)\(backendHost)\(BackendUrlManager.SERVICE_CONTEXT[index])";
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


enum BrigdeCoreRouter:URLRequestConvertible {
    
    //static let backendHost = "172.22.49.66:9090/"
    static let backendHost = "172.22.209.88:9090/"
    
    static let backendProtocol = "http://"
    
    static let baseURLString = "\(backendProtocol)\(backendHost)"
    
    //Cases
    case selectEnableCoins(parameters:Parameters)
    case selectTransaction(terminalCode:String, storeCode:String, paramters:Parameters)
    case logoff(terminalCode:String, storeCode:String, parameters:Parameters)
    case login(terminalCode:String, storeCode:String, parameters:Parameters)
    case cancelTransaction(terminalCode:String, storeCode:String, parameters:Parameters)
    
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
            
            
        }
    }
    
    
    func asURLRequest() throws -> URLRequest
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
        }
        
        return urlRequest
    }
}

