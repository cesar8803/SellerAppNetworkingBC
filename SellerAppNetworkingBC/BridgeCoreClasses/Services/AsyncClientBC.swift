//
//  AsyncClientBC.swift
//  SellerAppNetworkingBC
//
//  Created by Bernardino Guerrero Ibarra on 7/3/17.
//  Copyright © 2017 Liverpool. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

public class AsyncClientBC
{
    
   
    
    /************** Petición GET con Parametros **********************/
    class func getRequestExecute<T:Mappable>(_ type:BackendUrlManager.ServiceUrlsId, parameters: Parameters, completion:@escaping (_ dataResponse:T) -> Void, errorCompletition: @escaping (_ errorString:String) -> Void){
        
        let url = BackendUrlManager.Current.getUrl(type)
        Alamofire.request(url, method: .get, parameters: parameters).responseObject { (response: DataResponse<T>) in
            
            if response.result.isSuccess{
                let responseService = response.result.value
                completion(responseService!)
            } else {
                errorCompletition((response.result.error?.localizedDescription)!)
            }
        }
    }
    
    /************** Petición GET **********************/
    class func getRequestExecute<T:Mappable>(_ type:BackendUrlManager.ServiceUrlsId, completion:@escaping (_ dataResponse:T) -> Void, errorCompletition: @escaping (_ errorString:String) -> Void){
        
        let url = BackendUrlManager.Current.getUrl(type)
        
        Alamofire.request(url, method: .get).responseObject { (response: DataResponse<T>) in
            
            if response.result.isSuccess{
                let responseService = response.result.value
                completion(responseService!)
            } else {
                errorCompletition((response.result.error?.localizedDescription)!)
            }
        }
    }
    

    
    
    /************** Petición POST **********************/
    class func postRequestExecuteWithTimeOut<T:Mappable>(_ _Type:BackendUrlManager.ServiceUrlsId, _Parameters: Parameters, _ViewLoader:Bool, _MsjLoader: String,_Completion:@escaping (_ _postRequest: T) -> Void, _ErrorCompletition: @escaping (_ errorString:String) -> Void){
        
        let url:URL! = URL(string: BackendUrlManager.Current.getUrl(_Type))
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 300 // 10 secs
        //let values = ["key": "value"]
        request.httpBody = try! JSONSerialization.data(withJSONObject: _Parameters, options: [])
        
        Alamofire.request(request).responseObject { (response: DataResponse<T>) in
            
            if response.result.isSuccess{
                let responseService = response.result.value
                _Completion(responseService!)
                
            }else{
                _ErrorCompletition((response.result.error?.localizedDescription)!)
            }
        }
    }
    
    /************** Petición POST Serializa un objeto JSON**********************/
    
    class func postRequestExecute<T:Mappable>(_ _Type:BackendUrlManager.ServiceUrlsId, _Parameters: Parameters!, _Completion:@escaping (_ _postRequest: T) -> Void, _ErrorCompletition: @escaping (_ errorString:String) -> Void)
    {
        let url = URL(string: BackendUrlManager.Current.getUrl(_Type))
        let request = NSMutableURLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: _Parameters, options: [])
        
        
        Alamofire.request(url!, method: .post, parameters: _Parameters, encoding: JSONEncoding.default).responseObject { (response: DataResponse<T>) in
            
            if response.result.isSuccess{
                let responseService = response.result.value
                _Completion(responseService!)
            }else{
                _ErrorCompletition((response.result.error?.localizedDescription)!)
            }
        }
    }
    
    
    /************** Petición PUT **********************/

    class func putRequestExecute<T:Mappable>(_ type:BackendUrlManager.ServiceUrlsId, parameters: Parameters, viewLoader:Bool, msjLoader: String, completion:@escaping (_ putResponse:T) -> Void, errorCompletition: @escaping (_ errorString:String) -> Void){
        
        let url = BackendUrlManager.Current.getUrl(type)
        print("url..:\(url)")
        Alamofire.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default).responseObject { (response: DataResponse<T>) in
            
            if response.result.isSuccess{
                let responseService = response.result.value
                completion(responseService!)
                
            }else{
                errorCompletition((response.result.error?.localizedDescription)!)
            }
        }
    }
    
    /**********************************PETICION DELETE***********************************/
    class func deleteRequestExecute<T:Mappable>(_ _Type:BackendUrlManager.ServiceUrlsId, _Parameters: Parameters!, _Completion:@escaping (_ _postRequest: T) -> Void, _ErrorCompletition: @escaping (_ errorString:String) -> Void)
    {
        let url = URL(string: BackendUrlManager.Current.getUrl(_Type))
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        Alamofire.request(url!, method: .delete, parameters: _Parameters, encoding: URLEncoding.default, headers: headers).responseObject { (response: DataResponse<T>) in
            
            if response.result.isSuccess{
                let responseService = response.result.value
                _Completion(responseService!)
            }else{
                _ErrorCompletition((response.result.error?.localizedDescription)!)
                
            }
        }
    }

}
