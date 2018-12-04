//
//  BridgCoreServices.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/7/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import ObjectMapper

public protocol PaymentMethod
{
    var paymentMethod:Int {get set}
    var paymentAmount:Double {get set}
    var paymentQuantity:Int {get set}
    var voidFlag:Bool {get set}
}

enum ServiceResponseError: Error {
    case unexpectedResponse(String, Int)
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
    
    public class func cancelTransaction(connectionId:String, storeCode:String, terminalCode:String) -> Promise<BridgeCore>
    {
        return Promise { fulfill, reject in
            
            let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"cancelTransaction"] as [String : Any]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            firstly {
                AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.cancelTransaction(terminalCode: terminalCode, storeCode: storeCode, parameters: params))
                }.then { (bridgeCoreResponse: BridgeCore) -> Void in
                    fulfill(bridgeCoreResponse)
                }.catch {error in
                    reject(error)
            }
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
    
    public class func logoff(connectionId:String, storeCode:String, terminalCode:String) -> Promise<BridgeCore>
    {
        return Promise { fulfill, reject in
            let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"logoff"] as [String : Any]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            
            firstly {
                AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.logoff(terminalCode: terminalCode, storeCode: storeCode, parameters: params))
                }.then { (bridgeCoreResponse: BridgeCore) -> Void in
                    fulfill(bridgeCoreResponse)
                }.catch {error in
                    reject(error)
            }
        }
    }
    
    public class func passthruPromise<T:Any>(data: T) -> Promise<T>
    {
        return Promise { fulfill, reject in
            fulfill(data)
        }
    }
    
    public class func configureTerminal(terminalCode: String, storeCode: String, enablingTerminal:Bool) -> Promise<BridgeCore> {
        return Promise { fulfill, reject in
            
            let params = ["storeCode":storeCode, "terminalCode":terminalCode, "enablingTerminal" : enablingTerminal] as [String : Any]
            let request = ["operation":"configureTerminal", "params": params] as [String : Any]
            let bcRequest: Parameters = ["bridgeCoreRequest": request]
            
            firstly {
                AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.configureTerminal(paramters: bcRequest))
                }.then { (bridgeCoreResponse: BridgeCore) -> Void in
                    fulfill(bridgeCoreResponse)
                }.catch {error in
                    reject(error)
            }
        }
    }
    
    public class func forciblyLogoff(connectionId:String, storeCode:String, terminalCode:String) -> Promise<BridgeCore>
    {
        return Promise { fulfill, reject in
            var closeCalled: Bool = false
            var returnSelectedCalled: Bool = false
            firstly {
                BridgeCoreServices.logoff(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode)
                }.then { response -> Promise<BridgeCore> in
                    switch response.bridgeCoreResponse?.ack ?? -1 {
                    case 10049://Transaction is in course. Needs to cancel transaction
                        returnSelectedCalled = true
                        return BridgeCoreServices.returnSelect(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode)
                    case 30013://Not a valid connectionId. Create a new connectionId
                        closeCalled = true
                        return BridgeCoreServices.closeSession(storeCode: storeCode, terminalCode: terminalCode)
                    case 30025://Maybe already logged-off TODO: check all cases
                        response.bridgeCoreResponse?.ack = 0
                        return BridgeCoreServices.passthruPromise(data: response)
                    case 0:
                        return BridgeCoreServices.passthruPromise(data: response)
                    default:
                        throw ServiceResponseError.unexpectedResponse("No se pudo completar la operación correctamente. Por favor reintente.", (response.bridgeCoreResponse?.ack)!)
                    }
                }.then { response ->  Promise<BridgeCore> in
                    if response.bridgeCoreResponse?.ack == 0 {
                        if closeCalled {
                            return BridgeCoreServices.startUpSession(storeCode: storeCode, terminalCode: terminalCode)
                        } else if returnSelectedCalled {
                            return BridgeCoreServices.logoff(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode)
                        }else{
                            return BridgeCoreServices.passthruPromise(data: response)
                        }
                    }
                    throw ServiceResponseError.unexpectedResponse("No se pudo completar la operación correctamente. Por favor reintente.", (response.bridgeCoreResponse?.ack)!)
                }.then { response -> Void in
                    fulfill(response)
                }.catch { error in
                    reject(error)
            }
        }
    }
    
    public class func findWalletBalance(terminalCode:String, account:String, storeCode:String, entryMethod:String, track1:String, track2:String, cvv:String, printerTypeName:String, printerStationType:String) -> Promise<BridgeCore>
    {
        return Promise { fulfill, reject in
            
            let bridgeCoreRequestDict = ["terminalCode":terminalCode, "account":account, "storeCode":storeCode, "entryMethod":entryMethod,"track1":track1,"track2":track2, "cardPaymentinputCvv":cvv, "printerTypeName":printerTypeName, "printerStationType":printerStationType] as [String : Any]
            let otherParams = ["params":bridgeCoreRequestDict,"operation":"findWalletBalance"] as [String : Any]
            let params: Parameters = ["bridgeCoreRequest": otherParams]
            
            firstly {
                AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.findWalletBalance(terminalCode: terminalCode, storeCode: storeCode, paramters: params))
                }.then { (bridgeCoreResponse: BridgeCore) -> Void in
                    fulfill(bridgeCoreResponse)
                }.catch {error in
                    reject(error)
            }
        }
    }
    
    public class func findWalletBalance(terminalCode:String, storeCode:String, entryMethod:String,track1 :String, track2:String, cvv:String, printerTypeName:String, printerStationType:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let bridgeCoreRequestDict = ["terminalCode":terminalCode, "account":"", "storeCode":storeCode, "entryMethod":entryMethod,"track1":track1,"track2":track2, "cardPaymentinputCvv":cvv, "printerTypeName":printerTypeName, "printerStationType":printerStationType] as [String : Any]
        
        let otherP = ["params":bridgeCoreRequestDict,"operation":"findWalletBalance"] as [String : Any]
        let p:Parameters = ["bridgeCoreRequest":otherP]
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.findWalletBalance(terminalCode: terminalCode, storeCode: storeCode, paramters: p), completion: { (bridgeCoreResponse) in
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
    
    public class func logIn(connectionId:String, storeCode:String, terminalCode:String, userName:String, userPassword:String, trainingMode:Bool) -> Promise<BridgeCore>
    {
        return Promise { fulfill, reject in
            let params: Parameters = ["userName":userName, "userPassword":userPassword, "trainingMode":trainingMode]
            let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"login", "params":params] as [String : Any]
            let bcParams: Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            
            firstly {
                AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.login(terminalCode: terminalCode, storeCode: storeCode, parameters: bcParams))
                }.then { (bridgeCoreResponse: BridgeCore) -> Void in
                    fulfill(bridgeCoreResponse)
                }.catch {error in
                    reject(error)
            }
        }
    }
    
    
    
    public class func logOffBoss(connectionId:String, storeCode:String, terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"logoff"] as [String : Any]
        
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.logoff(terminalCode: terminalCode, storeCode: storeCode, parameters: p), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func loginBoss(userName:String, userPass:String, connectionId:String, storeCode:String, terminalCode:String,trainingMode:Bool, completion: @escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let params:Parameters = ["userName":userName, "userPassword":userPass, "trainingMode":trainingMode]
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"login", "params":params] as [String : Any]
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        let bcRouter = BrigdeCoreRouter.login(terminalCode: terminalCode, storeCode: storeCode, parameters: p)
        AsyncClientBC.getBCRequest(bcRouter: bcRouter, completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func cancelSale(connectionId:String, storeCode:String, terminalCode:String, docto: String, amount: String, userName:String, userPassword:String, trainingMode:Bool, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let oper: BridgeCoreOperation = BridgeCoreOperation.cancelTransactionWithDocument(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, document: docto, amount: amount)
        
        let (params, _, _) = oper.getParams()
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.selectTransaction(terminalCode: terminalCode, storeCode: storeCode, paramters: params), completion: { (responseBC) in
            
            completion(responseBC)
            
        }) { (msg) in
            
            completionError(msg)
        }
    }
    
    public class func useCard(connectionId:String, terminalCode: String, storeCode: String, dataDictionary: Any, operationType: String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let oper:BridgeCoreOperation = BridgeCoreOperation.cardCancel(connectionId: connectionId, operation: operationType, terminalCode: terminalCode, storeCode: storeCode, object: dataDictionary)
        
        let (params, _, _) = oper.getParams()
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.useCardPayment(terminalCode: terminalCode, storeCode: storeCode, paramters: params), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
        
    }
    
    
    public class func addTender(connectionId:String, storeCode:String, terminalCode:String, payments:[PaymentMethod], userName:String, userPassword:String, trainingMode:Bool, tbRecIngresos:Bool, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        BridgeCoreServices.logoff(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, completion: { (bridgeCore) in
            
            guard let brigeResponse = bridgeCore.bridgeCoreResponse else { completionError("Algo salio mal, por favor consulte soporte"); return }
            
            if brigeResponse.ack == 0{ //LogOff successful
                BridgeCoreServices.logIn(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, userName: userName, userPassword: userPassword, trainingMode: trainingMode, completion: { (loginBridgeCore) in
                    
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
                                                    semaphore.signal()
                                                }else{
                                                    //Cancelar la transacción y todo el proceso
                                                    print("Cancelar la transacción y todo el proceso...:\(withdrawalBridgeCoreResponse.message ?? "-")")
                                                    guard let ackNumber = withdrawalBridgeCoreResponse.ack , let errMsg = withdrawalBridgeCoreResponse.message else {
                                                        storedError = NSError(domain: "TenderError.Domain", code: -1000, userInfo: ["message":"unknow error"])
                                                        return
                                                    }
                                                    storedError = NSError(domain: "TenderError.Domain", code: ackNumber, userInfo: ["message":errMsg])
                                                    completion(withdrawalBridgeCore)
                                                }
                                            }
                                        }, completionError: { (msg) in
                                            storedError = NSError(domain: "TenderError.Domain", code: -1000, userInfo: ["message":msg])
                                            semaphore.signal()
                                        })
                                        
                                        let _:DispatchTimeoutResult = semaphore.wait(timeout: DispatchTime.distantFuture)
                                        
                                        if let errorInSomeTender = storedError?.userInfo["message"] as? String{
                                            completionError(errorInSomeTender)
                                        }
                                        
                                        if storedError != nil {
                                            //terminar el for
                                            debugPrint("Terminar el for...")
                                            continue
                                        }
                                        
                                        
                                    }
                                    
                                    if storedError == nil{
                                        var laParams:[String: Any] = [:]
                                        if tbRecIngresos{
                                            laParams = ["printerTypeName": "1001", "printerStationType": "4", "printerTemplate": "transaction.vcl", "invoiceAccepted": false, "tiendaDeReconocimiento": storeCode,"canalDeVenta": "10","subCanalDeVenta": "12","campoLibreReconocimiento": ""]
                                        }else{
                                            laParams = ["printerTypeName": "1001", "printerStationType": "4", "printerTemplate": "transaction.vcl", "invoiceAccepted": false]
                                        }
                                        
                                        finishTransactionPrinter(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, params: laParams, completion: completion, completionError: completionError)
                                    }
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
    
    public class func closeTerminal(connectionId:String, userName: String, userPass: String, storeCode:String, terminalCode:String, giftTicket: Bool = false,trainingMode:Bool, tbRecIngresos:Bool, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        
        BridgeCoreServices.logIn(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, userName: userName, userPassword: userPass, trainingMode: trainingMode, completion: { (loginBridgeCoreResponse) in
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
            }else if bcLoginR.ack == 10000 || bcLoginR.ack == 10001{
                completionError(bcLoginR.message ?? "No se pudo verificar la autorización del jefe")
            }else
            {
                BridgeCoreServices.logoff(connectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, completion: { (logoffBridgeCoreResponse) in
                    guard let bcLogoffR = logoffBridgeCoreResponse.bridgeCoreResponse else {
                        completionError("bridgeCoreResponse is nil")
                        return }
                    
                    if bcLogoffR.ack == 0
                    {
                        self.closeTerminal(connectionId: connectionId, userName: userName, userPass: userPass, storeCode: storeCode, terminalCode: terminalCode, giftTicket: false,trainingMode : trainingMode, tbRecIngresos: tbRecIngresos, completion: completion, completionError:completionError)
                    }else if bcLogoffR.ack == 10049{
                        
                        var laParams:[String: Any] = [:]
                        if tbRecIngresos{
                            laParams = ["cancelReasonCode":"","tiendaDeReconocimiento": storeCode,"canalDeVenta": "10","subCanalDeVenta": "12","campoLibreReconocimiento": ""]
                        }else{
                            laParams = ["cancelReasonCode":""]
                        }
                        
                        BridgeCoreServices.cancelTransactionWithParams(coneectionId: connectionId, storeCode: storeCode, terminalCode: terminalCode, params: laParams, completion: { (responseCancel) in
                            guard let bcCancelR = responseCancel.bridgeCoreResponse else {
                                completionError("bridgeCoreResponse is nil")
                                return }
                            if bcCancelR.ack == 0{
                                self.closeTerminal(connectionId: connectionId, userName: userName, userPass: userPass, storeCode: storeCode, terminalCode: terminalCode, giftTicket: false,trainingMode : trainingMode, tbRecIngresos: tbRecIngresos, completion: completion, completionError:completionError)
                            }else{
                                completionError(bcLoginR.message ?? "No se pudo verificar la autorización del jefe")
                            }
                        }) { (msg) in
                            if msg.count > 0 {
                                completionError(msg)
                            }else {
                                completionError("No se pudo verificar la autorización del jefe")
                            }
                        }
                    }else {
                        completionError(bcLogoffR.message ?? "")
                    }
                }) { (msg) in
                    completionError(msg)
                }
            }
            
        }, completionError: { (loginBridgeCoreResponse) in
            
            //completionError(message)
            
            //completion(logoffBridgeCoreResponse)
            
        })
    }
    
    
    public class func returnSelect(connectionId:String, storeCode:String, terminalCode:String) -> Promise<BridgeCore> {
        return Promise { fulfill, reject in
            let oper = BridgeCoreOperation.returnSelect(connectionId: connectionId)
            
            firstly {
                AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.returnSelect(terminalCode: terminalCode, storeCode: storeCode, operation: oper))
                }.then { (bridgeCoreResponse: BridgeCore) -> Void in
                    fulfill(bridgeCoreResponse)
                }.catch {error in
                    reject(error)
            }
        }
        
    }
    
    public class func returnSelect(connectionId:String, storeCode:String, terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC){
        
        let oper = BridgeCoreOperation.returnSelect(connectionId: connectionId)
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.returnSelect(terminalCode: terminalCode, storeCode: storeCode, operation: oper), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func selectTransactionWithParams(connectionId:String, storeCode:String, terminalCode:String, params:Parameters, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC){
        
        let oper = BridgeCoreOperation.selectTransactionWithParams(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, params: params)
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.selectTransactionWithOperation(terminalCode: terminalCode, storeCode: storeCode, operation: oper), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func finishTransactionWithParams(connectionId:String, storeCode:String, terminalCode:String, params:Parameters, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC){
        
        let oper = BridgeCoreOperation.finishTransactionWithParams(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, params: params)
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.selectTransactionWithOperation(terminalCode: terminalCode, storeCode: storeCode, operation: oper), completion: { (finishTransactionOper) in
            completion(finishTransactionOper)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func finishTransactionPrinter(connectionId:String, storeCode:String, terminalCode:String, params:Parameters, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC){
        
        let oper = BridgeCoreOperation.finishTransactionPrinter(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, params: params)
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.selectTransactionWithOperation(terminalCode: terminalCode, storeCode: storeCode, operation: oper), completion: { (finishTransactionOper) in
            completion(finishTransactionOper)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func cancelTransactionWithParams(coneectionId:String, storeCode:String, terminalCode:String, params:Parameters, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC){
        
        let bridgeCoreRequestDict = ["connectionId":coneectionId, "operation":"cancelTransaction", "params":params] as [String : Any]
        
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.cancelTransaction(terminalCode: terminalCode, storeCode: storeCode, parameters: p), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func cancelTransactionWithParams(connectionId:String, storeCode:String, terminalCode:String) -> Promise<BridgeCore>
    {
        return Promise { fulfill, reject in
            let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"logoff"] as [String : Any]
            let params:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
            
            firstly {
                AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.cancelTransaction(terminalCode: terminalCode, storeCode: storeCode, parameters: params))
                }.then { (bridgeCoreResponse: BridgeCore) -> Void in
                    fulfill(bridgeCoreResponse)
                }.catch {error in
                    reject(error)
            }
        }
    }
    
    
    public class func addCashPayment(connectionId:String, storeCode:String, terminalCode:String, params:Parameters, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC){
        
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"addCashPayment", "params":params] as [String : Any]
        
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.addCashPayment(terminalCode: terminalCode, storeCode: storeCode, paramters: p), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func closeSession(storeCode:String, terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC){
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.closeSession(terminalCode: terminalCode, storeCode: storeCode), completion: { (closeTrasactionResponse) in
            completion(closeTrasactionResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func closeSession(storeCode:String, terminalCode:String) -> Promise<BridgeCore> {
        return Promise { fulfill, reject in
            firstly {
                AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.closeSession(terminalCode: terminalCode, storeCode: storeCode))
                }.then { (bridgeCoreResponse: BridgeCore) -> Void in
                    fulfill(bridgeCoreResponse)
                }.catch {error in
                    reject(error)
            }
        }
    }
    
    public class func startUpSession(storeCode:String, terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC){
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.startupSession(terminalCode: terminalCode, storeCode: storeCode), completion: { (closeTrasactionResponse) in
            completion(closeTrasactionResponse)
        }) { (msg) in
            completionError(msg)
        }
        
    }
    
    public class func startUpSession(storeCode:String, terminalCode:String) -> Promise<BridgeCore>
    {
        return Promise { fulfill, reject in
            firstly {
                AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.startupSession(terminalCode: terminalCode, storeCode: storeCode))
                }.then { (bridgeCoreResponse: BridgeCore) -> Void in
                    fulfill(bridgeCoreResponse)
                }.catch {error in
                    reject(error)
            }
        }
    }
    
    public class func addItem(connectionId:String, storeCode:String, terminalCode:String, item:BCRequestParams,  completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let oper = BridgeCoreOperation.addItem(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, params: item.getParamsForRequest())
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.addItem(operation: oper), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
        
    }
    
    public class func giftItem(connectionId:String, storeCode:String, terminalCode:String, item:BCRequestParams,  completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let oper = BridgeCoreOperation.giftItem(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, params: item.getParamsForRequest())
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.addItem(operation: oper), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
        
    }
    
    public class func updateKeysPinPad(token:String,terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let params = ["tokens":token, "terminalCode":terminalCode]
        let bridgeCoreRequestDict = ["params": params, "operation":"sendForceKeysMessage"] as [String : Any]
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.updatePinPadKeys(parameters: p), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func promotionMapVersion(storeCode: String,terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let params = ["printerTypeName": "1003","aplicationNameCore": "BCORE","printerStationType": "6","reportTerminalType": "SOLICITUD","storeCode":storeCode, "terminalCode":terminalCode]
        let bridgeCoreRequestDict = ["params": params, "operation":"generateTerminalReport"] as [String : Any]
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.promotionMapVersion(parameters: p), completion: { (bridgeCoreResponse) in
            completion(bridgeCoreResponse)
        }) { (msg) in
            completionError(msg)
        }
    }
    
    public class func addCardPayment(connectionId:String, storeCode:String, terminalCode:String, parameters: Parameters,  completion:@escaping (_ dataResponse: BridgecorePaymentResponse)-> Void, completionError: @escaping ErrorStringHandlerBC){
        
        let operation = BridgeCoreOperation.addCardPayment(connectionId: connectionId, terminal: terminalCode, store: storeCode, params: parameters)
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.addCardPayment(operation: operation), completion: { (response) in
            completion(response)
        }) { (error) in
            completionError(error)
        }
    }
    
    public class func applyDiscountToItem(connectionId: String, storeCode: String, terminalCode: String, params:Parameters, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC)
    {
        let bridgeCoreRequestDict = ["connectionId":connectionId, "operation":"applyDiscountToItem", "params":params] as [String : Any]
        
        let p:Parameters = ["bridgeCoreRequest":bridgeCoreRequestDict]
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.applyDiscount(terminalCode: terminalCode, storeCode: storeCode, paramters: p), completion: { (response) in
            
            completion(response)
        }) { (error) in
            
            completionError(error)
        }
    }
    
    public class func addMonederoPayment(connectionId:String, storeCode:String, terminalCode:String, parameters: Parameters,  completion:@escaping (_ dataResponse: BridgecorePaymentResponse)-> Void, completionError: @escaping ErrorStringHandlerBC){
        
        let operation = BridgeCoreOperation.addMonederoPayment(connectionId: connectionId, terminal: terminalCode, store: storeCode, params: parameters)
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.addMonederoPayment(operation: operation), completion: { (response) in
            completion(response)
        }) { (error) in
            completionError(error)
        }
    }
    
    /*Generic*/
    public class func totalizeWithRequest(request:BCRequestProtocol, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC){
        let bcO = BridgeCoreOperation.totalizeTransactionWithRequest(request: request)
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.totalizeTransaction(operation: bcO), completion: completion, errorCompletition: completionError)
    }
    
    //TOTALIZE MESA DE REGALOS
    public class func grTotalizeWithParams(params:Parameters, connectionId:String, storeCode:String, terminalCode:String, completion:@escaping (_ dataResponse: BridgeCore)-> Void, completionError: @escaping ErrorStringHandlerBC){
        
        let bc1 = BridgeCoreOperation.totalizeTransaction(connectionId: connectionId, terminalCode: terminalCode, storeCode: storeCode, params: params)
        
        AsyncClientBC.getBCRequest(bcRouter: BrigdeCoreRouter.totalizeTransaction(operation: bc1), completion: completion, errorCompletition: completionError)
    }
}

