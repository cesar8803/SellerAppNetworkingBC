//
//  CloseTerminal.swift
//  SellerAppNetworkingBC
//
//  Created by Maetzin  on 26/07/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import XCTest

@testable import SellerAppNetworkingBC

class CloseTerminal: XCTestCase {
    
    var terminalCode:String = ""
    var storeCode:String = ""
    var connId:String = ""
    var userName:String = ""
    var userPass:String = ""

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        terminalCode = "949"
        storeCode = "0103"
        connId = "db63abf8-4e24-462a-b650-461004e9c3dc"
        userName = "10700"
        userPass = "345"
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOperation() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let oper: BridgeCoreOperation = BridgeCoreOperation.selectTransaction(connectionId: connId, terminalCode: terminalCode, storeCode: storeCode, transactionSubtype: BCTransactionSubtype.TERMINAL_CLOSE, giftTicket: false )
        
        let (params, _, _) = oper.getParams()
        
        let bcRequest = params["bridgeCoreRequest"]
       
        
        XCTAssertNotNil(params, "No debe ser nil")
        XCTAssertNotNil(bcRequest, "No debe ser nil")
        
         let ex = expectation(description: "Call find item was successful")
        BridgeCoreServices.closeTerminal(connectionId: connId, userName: userName, userPass: userPass, storeCode: storeCode, terminalCode: terminalCode, completion: { (closeTermBridgeCore) in
            XCTAssertNotNil(closeTermBridgeCore, "No debe ser nil")
            XCTAssertNotNil(closeTermBridgeCore.bridgeCoreResponse, "No debe ser nil")
            XCTAssertEqual(closeTermBridgeCore.bridgeCoreResponse?.ack, 0, "Algo paso \(closeTermBridgeCore.bridgeCoreResponse?.ack)")
            ex.fulfill()
        }) { (msg) in
            XCTAssertNil(msg, "Something was wrong: \(msg)")
        }
       
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Test timeout \(error?.localizedDescription ?? "---")")
        }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
