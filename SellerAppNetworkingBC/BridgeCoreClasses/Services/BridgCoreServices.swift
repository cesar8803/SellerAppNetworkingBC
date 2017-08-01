//
//  BridgCoreServices.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/7/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import Alamofire

public protocol PaymentMethod
{
    var paymentMethod:Int {get set}
    var paymentAmount:Double {get set}
    var paymentQuantity:Int {get set}
    var voidFlag:Bool {get set}
}



public class BridgeCoreServices
{
    public class func cancelTransaction(connectionId:String, storeCode:String, terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"cancelTransaction"] as [String : Any]
        
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.cancelTransaction(terminalCode: terminalCode, storeCode: storeCode, parameters: p), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func logoff(connectionId:String, storeCode:String, terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        //let params = ["storeCode":storeCode, "terminalCode":terminalCode]
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"logoff"] as [String : Any]
        
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        
    
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.logoff(terminalCode: terminalCode, storeCode: storeCode, parameters: p), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func logIn(connectionId:String, storeCode:String, terminalCode:String, userName:String, userPassword:String, trainingMode:Bool, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let params:Parameters = ["userName":userName, "userPassword":userPassword, "trainingMode":trainingMode]
        
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"login", "params":params] as [String : Any]
        
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        

        let bcRouter = BrigdeCoreRouter.login(terminalCode: terminalCode, storeCode: storeCode, parameters: p)
        AsyncClientBC.getBCRequest(bcRouter: bcRouter, completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func loginBoss(userName:String, userPass:String, connectionId:String, storeCode:String, terminalCode:String, completion: @escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        BridgeCoreServices.logIn(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, userName: userName, userPassword: userPass, trainingMode: false, completion: { (loginBridgeCore) in
            
            guard let brigeCoreLoginResponse = loginBridgeCore.bridgeCoreResponse else { completionError("Algo salio mal, por favor consulte soporte"); return }
            
            if brigeCoreLoginResponse.ack == 0 //Login success
            {
                completion(loginBridgeCore)
            }
        }, completionError: { (msg) in
            completionError(msg)
        })
    }
    
    public class func cancelSale(connectionId:String, storeCode:String, terminalCode:String, docto: String, amount: String, userName:String, userPassword:String, trainingMode:Bool, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let oper: BridgeCoreOperation = BridgeCoreOperation.selectTransaction(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, transactionSubtype: BCTransactionSubtype.CANCEL_TRANSACTION, giftTicket: false)
        
        let (params, _, _) =  oper.getParams()
        let bcRouter = BrigdeCoreRouter.selectTransaction(terminalCode: terminalCode, storeCode: storeCode, paramters: params)
        
        
        AsyncClientBC.getBCRequest(bcRouter: bcRouter, completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
        
        
        /*BridgeCoreServices.logoff(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, completion: { (bridgeCore) in
            
            guard let brigeResponse = bridgeCore.bridgeCoreResponse else { completionError("Algo salio mal, por favor consulte soporte"); return }
            
            if brigeResponse.ack == 0{ //LogOff successful
                BridgeCoreServices.logIn(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, userName: userName, userPassword: userPassword, trainingMode: false, completion: { (loginBridgeCore) in
                    
                    guard let brigeCoreLoginResponse = loginBridgeCore.bridgeCoreResponse else { completionError("Algo salio mal, por favor consulte soporte"); return }
                    
                    if brigeCoreLoginResponse.ack == 0 //Login success
                    {
                        let oper: BridgeCoreOperation = BridgeCoreOperation.selectTransaction(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, transactionSubtype: BCTransactionSubtype.CANCEL_TRANSACTION, giftTicket: false)
                        
                        let (params, _, _) =  oper.getParams()
                        let bcRouter = BrigdeCoreRouter.selectTransaction(terminalCode: terminalCode, storeCode: storeCode, paramters: params)
                        
                        
                        AsyncClientBC.getBCRequest(bcRouter: bcRouter, completion: { (bridgeCoreResponse) in
                            completion(bridgeCoreResponse)
                        }) { (msg) in
                            completionError(msg)
                        }
                        
                    }else{
                        if let msg = brigeCoreLoginResponse.message{
                            completionError(msg)
                        }else{
                            completionError("Algo salio mal, por favor consulte soporte")
                        }
                    }
                    
                }, completionError: { (msg) in
                    completionError(msg)
                })
            }else{
                if let msg = brigeResponse.message{
                    completionError(msg)
                }else{
                    completionError("Algo salio mal, por favor consulte soporte")
                }
            }
        }) { (msg) in
            completionError(msg)
        }*/
    }
    
    
    public class func addTender(connectionId:String, storeCode:String, terminalCode:String, payments:[PaymentMethod], userName:String, userPassword:String, trainingMode:Bool, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        BridgeCoreServices.logoff(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, completion: { (bridgeCore) in
            
            guard let brigeResponse = bridgeCore.bridgeCoreResponse else { completionError("Algo salio mal, por favor consulte soporte"); return }
            
            if brigeResponse.ack == 0{ //LogOff successful
                BridgeCoreServices.logIn(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, userName: userName, userPassword: userPassword, trainingMode: false, completion: { (loginBridgeCore) in
                    
                     guard let brigeCoreLoginResponse = loginBridgeCore.bridgeCoreResponse else { completionError("Algo salio mal, por favor consulte soporte"); return }
                    
                    if brigeCoreLoginResponse.ack == 0 //Login success
                    {
                     
                        
                        
                        let oper: BridgeCoreOperation = BridgeCoreOperation.selectTransaction(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, transactionSubtype: BCTransactionSubtype.TENDER_WITHDRAWAL, giftTicket: false)
                        
                    
                        //Select transaction for tender withdrawal
                        Withdrawals.bridgeCoreOperationTransact(operation: oper, completion: { (bridgeCore) in
                            guard let response = bridgeCore.bridgeCoreResponse, let ack = response.ack else { return }
                            if ack == 0{
                                
                                
                               // let  sendTenderGroup = DispatchGroup() //All tenders
                                var storedError:NSError? = nil
                                
                                
                                DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
                                    let semaphore = DispatchSemaphore(value: 0)
                                    
                                    for idx in 0..<payments.count
                                    {
                                        
                                        
                                        let w = payments[idx]
                                        
                                        print("\(idx) 🌎 ")
                                        
                                        let oper:BridgeCoreOperation = BridgeCoreOperation.addTender(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, paymentAmount: "\(w.paymentAmount)", voidFalg: w.voidFlag, paymentMethod: "\(w.paymentMethod)", paymentQuantity: "\(w.paymentQuantity)")
                                        
                                        Withdrawals.bridgeCoreOperationTransact(operation: oper, completion: { (withdrawalBridgeCore) in
                                            
                                            print("\(idx) 🌎 - 🌕 ")
                                            if let withdrawalBridgeCoreResponse = withdrawalBridgeCore.bridgeCoreResponse
                                            {
                                                if withdrawalBridgeCoreResponse.ack == 0
                                                {
                                                    //Ejecutar el siguiente hilo
                                                    print("Ejecutar el siguiente hilo")
                                                    
                                                }else{
                                                    //Cancelar la transacción y todo el proceso
                                                    print("Cancelar la transacción y todo el proceso...:\(withdrawalBridgeCoreResponse.message ?? "-")")
                                                    
                                                    guard let ackNumber = withdrawalBridgeCoreResponse.ack , let errMsg = withdrawalBridgeCoreResponse.message else {
                                                        storedError = NSError(domain: "TenderError.Domain", code: -1000, userInfo: ["message":"unknow error"])
                                                        return
                                                    }
                                                    
                                                    storedError = NSError(domain: "TenderError.Domain", code: ackNumber, userInfo: ["message":errMsg])
                                                }
                                                
                                                
                                            }
                                            
                                            semaphore.signal()
                                            
                                        }, completionError: { (msg) in
                                            storedError = NSError(domain: "TenderError.Domain", code: -1000, userInfo: ["message":msg])
                                            semaphore.signal()
                                        })
                                        
                                        let _:DispatchTimeoutResult = semaphore.wait(timeout: DispatchTime.distantFuture)
                                        
                                        if let errorInSomeTender = storedError{
                                          completionError(errorInSomeTender.description)
                                        }
                                        
                                        
                                    }
                                    
                                    finishTransaction(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, completion: completion, completionError: completionError)
    
                                }
                                
                            }else{
                                if let msg = response.message{
                                  completionError(msg)
                                }
                            }
                        }) { (msg) in
                            completionError(msg)
                        }

                        
                    }else{
                        if let msg = brigeCoreLoginResponse.message{
                            completionError(msg)
                        }else{
                            completionError("Algo salio mal, por favor consulte soporte")
                        }
                    }
                    
                }, completionError: { (msg) in
                    completionError(msg)
                })
            }else{
                if let msg = brigeResponse.message{
                    completionError(msg)
                }else{
                    completionError("Algo salio mal, por favor consulte soporte")
                }
            }
            
        }) { (msg) in
            completionError(msg)
        }
    }
    
    
    public class func cancelTenderWithDocument(connectionID:String, storeCode:String, terminalCode:String, amount:String, document:String,completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let oper:BridgeCoreOperation = BridgeCoreOperation.cancelTransactionWithDocument(connectionId: connectionID, terminalCode: terminalCode, storeCode: storeCode, document: document, amount: amount)
        
        let (params, _, _) =  oper.getParams()
        let bcRouter = BrigdeCoreRouter.selectTransaction(terminalCode: terminalCode, storeCode: storeCode, paramters: params)
        
        
        AsyncClientBC.getBCRequest(bcRouter: bcRouter, completion: { (bridgeCoreResponse) in
           completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
        
    }
    
    
    public class func finishTransaction(connectionId:String, storeCode:String, terminalCode:String,completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        
        
        let oper:BridgeCoreOperation = BridgeCoreOperation.finishTransaction(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode)
        
        
        
        Withdrawals.bridgeCoreOperationTransact(operation: oper, completion: { (bridgeCoreFinishTransaction) in
            guard let response = bridgeCoreFinishTransaction.bridgeCoreResponse,  let ack = response.ack else { return }
            if ack == 0{
                completion(bridgeCoreFinishTransaction)
            }else{
                if let msg = response.message{
                    completionError(msg)
                }
            }
            
            
        }) { (msg) in
                completionError(msg)
            
        }
    }
    
    
    public class func cancelAndFinishTransaction(connectionId:String, storeCode:String, terminalCode:String,completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        BridgeCoreServices.cancelTransaction(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, completion: { (cancelBridgeCoreTransaction) in
            
            BridgeCoreServices.finishTransaction(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, completion: { (bridgeCoreFinishTrasaction) in
                completion(bridgeCoreFinishTrasaction)
            }, completionError: { (msg) in
                completionError(msg)
            })
            
        }, completionError: { (msg) in
            completionError(msg)
        })
    }
    
    public class func closeTerminal(connectionId:String, userName: String, userPass: String, storeCode:String, terminalCode:String, giftTicket: Bool = false, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        
        BridgeCoreServices.logoff(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, completion: { (logoffBridgeCoreResponse) in
            guard let bcLogoffR = logoffBridgeCoreResponse.bridgeCoreResponse else {
                completionError("bridgeCoreResponse is nil")
                return }
            
            if bcLogoffR.ack == 0
            {
                BridgeCoreServices.logIn(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, userName: userName, userPassword: userPass, trainingMode: false, completion: { (loginBridgeCoreResponse) in
                    guard let bcLoginR = loginBridgeCoreResponse.bridgeCoreResponse else {
                        completionError("bridgeCoreResponse is nil")
                    return}
                    
                    if bcLoginR.ack == 0
                    {
                        let oper: BridgeCoreOperation = BridgeCoreOperation.selectTransaction(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, transactionSubtype: BCTransactionSubtype.TERMINAL_CLOSE, giftTicket: false)
                        
                        let (params, _, _) =  oper.getParams()
                        let bcRouter = BrigdeCoreRouter.selectTransaction(terminalCode: terminalCode, storeCode: storeCode, paramters: params)
                        
                        
                        AsyncClientBC.getBCRequest(bcRouter: bcRouter, completion: { (bridgeCoreResponse) in
                            completion(bridgeCoreResponse)
                        }) { (msg) in
                            completionError(msg)
                        }
                    }
                    
                }, completionError: { (message) in
                    completionError(message)
                })
            }else{
                completionError(bcLogoffR.message ?? "")
            }
            
        }) { (msg) in
            completionError(msg)
        }
        
      
        

        
        

    }
    

    

}