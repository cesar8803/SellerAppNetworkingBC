//
//  TotalsData.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/5/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//


import Foundation
import ObjectMapper

public class TotalsData: Mappable{
    public var devolucion: Devolucion?
    public var totalComputador: TotalComputador?
    public var totalDiferencia: TotalDiferencia?
    public var entregado: Entregado?
    public var valesPapel: ValesPapel?
    public var voucher: Int?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map){
        devolucion <- map["devolucion"]
        totalComputador <- map["totalComputador"]
        totalDiferencia <- map["totalDiferencia"]
        entregado <- map["entregado"]
        valesPapel <- map["valesPapel"]
        voucher <- map["voucher"]
    }
}
