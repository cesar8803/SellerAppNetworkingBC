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
    public var totalComputador: Totalcomputador?
    public var totalDiferencia: Totaldiferencia?
    public var entregado: Entregado?
    public var valesPapel: Valespapel?
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
