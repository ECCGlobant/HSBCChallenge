//
//  LibraryAPI.swift
//  CodeChallenge
//
//  Created by Emmanuel Casanas Cruz on 7/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation


class LibraryAPI {
    
    static let sharedInstance = LibraryAPI()
    
    func getProfileInfo( Success onSuccess:@escaping (infoResponse) -> (), onError: @escaping (String) -> ()) {
        HTTPClient.sharedInstance.doRequest(method: "info.json" , type: "GET", parameters:nil, onSuccess: {(data) in
            let responseData = infoResponse(dictionary: data["data"] as! Dictionary<String, AnyObject>)
            onSuccess(responseData)
        }, onError: {(error) in
            onError(error.description)
            debugPrint(error.description)
        })
    }
    
}


