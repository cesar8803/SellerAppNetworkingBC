//
//  BudgetData.swift
//  SellerAppNetworkingBC
//
//  Created by Luis Guillermo Cuevas García on 27/07/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class BudgetData: Mappable{
    public var planName: String?
    public var budgetInstallments: [BudgetInstallments]?
    public var budgetAmount: BudgetAmount?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        planName <- map["planName"]
        budgetInstallments <- map["budgetInstallments"]
        budgetAmount <- map["budgetAmount"]
    }
}
