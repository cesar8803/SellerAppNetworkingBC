//
//  FindItemsBCTest.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/25/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import XCTest
@testable import SellerAppNetworkingBC

class FindItemsBCTest: XCTestCase {
    var terminalCode:String = ""
    var storeCode:String = ""
    var itemCode:String = ""
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        terminalCode = "964"
        storeCode = "0103"
        itemCode = "1045885719"
       
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEnum() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
       
        
        let oper = BridgeCoreOperation.findItem(terminalCode: terminalCode, storeCode: storeCode, itemCode: itemCode, exactMaching: true)
        XCTAssertNotNil(oper, "Something was wrong, oper can not be nil")
        
        let (params_, terminal_, store_) = oper.getParams()
        XCTAssertEqual(terminal_, terminalCode, "The terminals should be equal")
        XCTAssertEqual(store_, storeCode, "The storeres should be equal")
        XCTAssertNotNil(params_["bridgeCoreRequest"], "bridgeCoreRequest shouldn't be nil")
    }
    
    func testFindItems()
    {
        //let oper = BridgeCoreOperation.findItem(connectionId: "", terminalCode: terminal, storeCode: storeCode, itemCode: itemCode)
        
        let ex = expectation(description: "Call find item was successful")
        
        RefundsBC.findItems(storeCode: storeCode, terminalCode: terminalCode, itemCode: itemCode, exactMaching: true, completion: { (findItemBridgeCore) in
            XCTAssertNotNil(findItemBridgeCore, "the findItemsBridgeCore shouldn't nil")
            let bcResponse = findItemBridgeCore.bridgeCoreResponse
            XCTAssertNotNil(bcResponse, "the findItemsBridgeCore.bridgeCoreResponse shouldn't nil" )
            
            XCTAssertEqual(bcResponse?.ack, 0, "BridgeCore Response shuld be Zero")
            
            
            ex.fulfill()

        }) { (msg) in
            XCTAssertNil(msg, "Something was wrong: \(msg)")
        }
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Test timeout \(error?.localizedDescription ?? "---")")
        }
    }
    
    
    func testFindItemsList()
    {
        //let oper = BridgeCoreOperation.findItem(connectionId: "", terminalCode: terminal, storeCode: storeCode, itemCode: itemCode)
        
        let ex = expectation(description: "Call find item was successful")
        
        RefundsBC.findItemsList(storeCode: storeCode, terminalCode: terminalCode, itemsCodeList: ["1045885719","1045885859"], completion: { (findItemListBridgeCore) in
            
            XCTAssertNotNil(findItemListBridgeCore, "the findItemListBridgeCore shouldn't nil")
            let bcResponse = findItemListBridgeCore.bridgeCoreResponse
            XCTAssertNotNil(bcResponse, "the findItemsBridgeCore.bridgeCoreResponse shouldn't nil" )
            
            XCTAssertEqual(bcResponse?.ack, 0, "BridgeCore Response shuld be Zero")
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
