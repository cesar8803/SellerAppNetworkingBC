//
//  BridgeCoreConnection.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 8/22/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation

public class BridgeCoreConnection{
    public static let sharedInstance:BridgeCoreConnection = BridgeCoreConnection()
    public var urlString:String = ""
    private init(){}
}
