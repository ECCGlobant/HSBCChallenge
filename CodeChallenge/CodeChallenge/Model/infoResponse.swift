//
//  infoResponse.swift
//  CodeChallenge
//
//  Created by Emmanuel Casanas Cruz on 7/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class infoResponse: NSObject {
    var name : String
    var id : String
    var jobTitle : String
    var pictureURL : String
    var jobs: [Job]
    
    init(dictionary: Dictionary<String, AnyObject>) {
        name =  dictionary["name"] as? String ?? ""
        id = dictionary["id"] as? String ?? ""
        jobTitle = dictionary["job_title"] as? String ?? ""
        pictureURL = dictionary["picture"] as? String ?? ""
        jobs = Utility.getArrayOfJobs(dictionary: dictionary["jobs"] as! [Dictionary<String, AnyObject>])
    }
    
}
