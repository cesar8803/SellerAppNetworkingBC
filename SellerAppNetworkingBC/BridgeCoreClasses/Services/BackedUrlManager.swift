//
//  BackedUrlManager.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/3/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation

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
