//
//  RefundBCTest.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 8/2/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import XCTest
import Alamofire
@testable import SellerAppNetworkingBC

class RefundBCTest: XCTestCase {
    
    var terminalCode:String = ""
    var storeCode:String = ""
    var connId:String = ""
    var userName:String = ""
    var userPass:String = ""

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        terminalCode = "964"
        storeCode = "0103"
        connId = "db63abf8-4e24-462a-b650-461004e9c3dc"
        userName = "12431"
        userPass = "345"
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
 
    func testEnum() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        //let oper = BridgeCoreOperation.findItem(terminalCode: terminalCode, storeCode: storeCode, itemCode: itemCode, exactMaching: true)
        
        let bcRequestsParams = BCRequestParams.refoundNormalTransaction(refundOriginalTrxScannedCode: "", refundOriginalEmployee: userName, originalTrxStore: storeCode, refundCause: 1, giftTicket: false, scannedCodeEntryMethod: "Scanned")
        
        
        let oper = BridgeCoreOperation.selectTransactionWithParams(connectionId: connId, terminalCode: terminalCode, storeCode: storeCode, params: bcRequestsParams.getRequestParams())
        
        
        XCTAssertNotNil(oper, "Something was wrong, oper can not be nil")
        
        
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
}
