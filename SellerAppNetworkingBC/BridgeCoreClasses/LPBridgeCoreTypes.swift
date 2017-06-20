//
//  LPBridgeCoreTypes.swift
//  BridgeCoreProject
//
//  Created by Alejandro Hernandez on 14/06/17.
//  Copyright © 2017 Alejandro Hernandez. All rights reserved.
//

import Foundation

public enum LPTransactionSubtype: Int {
    case tender_WITHDRAWAL = 7
    case sale_NORMAL = 101
    case sale_SOMS = 102
    case sale_DULCERIA = 103
    case sale_RESTAURANTE = 104
    case sale_RESTAURANTE_SKU = 130
    case refund_NORMAL = 105
    case sale_VW = 111
    case cancel_TRANSACTION = 112
    case sale_GARANTIA = 113
    case terminal_CLOSE = 114
    case sale_GIFTS_PLAN=115
    case sale_ELECTRONIC_GIFT=116
    case package=117
    case sale_MONEDERO=118
    case payment_TOTAL_CARD=119
    case payment_SEGMENT_CARD = 120
    case refund_GIFTS_PLAN = 121
    case refund_SOMS = 106
}

public enum LPEntryMethod: String {
    case Scanned = "Scanned"
    case Keyed = "Keyed"
    case MSR = "MSR"
    case PPAD = "PPAD"
}

public enum LPGiftRegistryType: String {
    case Normal         = "0"
    case Shipping       = "1"
    case Certificate    = "2"
}

public enum Environment: Int {
    case development, qa, custom
}

public enum LPBridgeCoreServiceRequestMapping: String {
    case BridgeCore = "bridgeCoreRequest"
}
