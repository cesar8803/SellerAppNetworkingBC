//
//  AddItemListTest.swift
//  SellerAppNetworkingBC
//
//  Created by Alex Fierros on 10/08/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import XCTest
@testable import SellerAppNetworkingBC
import Alamofire
import ObjectMapper

class AddItemListTest: XCTestCase {
    
    
    var terminal:String = ""
    var store:String = ""
    var connId:String = ""
    var usr:String = ""
    var psw:String = ""
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        terminal = "962"
        store = "0103"
        connId = "1a2fc3d6-9d6a-446e-a2b7-21764d994e59"
        usr = "19278"
        psw = "345"
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    
    func testAddItemList(){
        
        let ex = expectation(description: "Call find addItemList was successful")
        RefundsBC.addItemList(connectionId: connId, storeCode: store, terminalCode: terminal, addItemListParams: [Item.init(itemPrice: "1232.64", warrantySelected: false, itemQty: "5", itemBarcode: "56120")], completion: { (BridgeCore) in
            
            XCTAssertNotNil(BridgeCore.bridgeCoreResponse, "bridgeCoreResponse was not nil")
            XCTAssertNotNil(BridgeCore, "the response was nil")
            
            ex.fulfill()
        }) { (msg) in
            XCTAssertNil(msg, "The message was not nil:\(msg)")
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
