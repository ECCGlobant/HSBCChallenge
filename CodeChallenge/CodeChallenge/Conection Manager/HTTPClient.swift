//
//  HTTPClient.swift
//  CodeChallenge
//
//  Created by Emmanuel Casanas Cruz on 7/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

class HTTPClient: NSObject {
    
    static let sharedInstance = HTTPClient()
    
    private let SERVER = APPURL.apiBaseURL
    
    
    
    private let session: URLSession
    private let config: URLSessionConfiguration
    
    private var request: NSMutableURLRequest?
    
    var params : Dictionary <String,AnyObject>?
    var needHeaders: Bool?
    
    
    override init(){
        config = URLSessionConfiguration.default
        
        session = URLSession(configuration: config)
        
        
    }
    
    func doRequest(method: String, type: String, parameters: Dictionary<String, AnyObject>?, onSuccess: @escaping ([String:AnyObject]) -> (), onError: @escaping (NSError) -> ()) {
        
        prepareRequestWithMethod(method: method, type: type)
        
        if parameters != nil {
            do {
                request!.httpBody = try JSONSerialization.data(withJSONObject: parameters!, options: [])
                // use anyObj here
            } catch {
                request!.httpBody = "".data(using: String.Encoding.utf8, allowLossyConversion: false)
            }
        } else {
            request!.httpBody = "".data(using: String.Encoding.utf8, allowLossyConversion: false)
        }
        
        
        
        var task = URLSessionDataTask()
        task = session.dataTask(with: request! as URLRequest, completionHandler: {(data, response, error) in
            //print("DataTask didEnd")
            
            if error != nil {
                onError(error! as NSError)
                return
            }
            let httpResponse = response as! HTTPURLResponse
            if (httpResponse.statusCode != 200) {
                //print("Received HTTP StatusCode: \(httpResponse.statusCode)")
                onError(NSError(domain: "Unexpected", code: httpResponse.statusCode, userInfo: [:]))
                return
            }
            
            var responseObject: [String:AnyObject] = [:]
            
            if (data?.count)! > 0 {
                
                do {
                    if let dictionaryOK = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                        
                        responseObject = dictionaryOK as [String:AnyObject]
                        // print(responseObject ?? "Empty Object")
                    }
                } catch {
                    print(error)
                }
            }
            
            onSuccess(responseObject)
        })
        task.resume()
    }
    
    
    func prepareRequestWithMethod(method: String, type: String) {
        let url = NSURL(string: "\(SERVER)\(method)")
        request = NSMutableURLRequest(url: url! as URL)
        request!.timeoutInterval = 30
    }
    
}


