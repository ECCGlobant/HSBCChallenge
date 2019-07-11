//
//  Job.swift
//  CodeChallenge
//
//  Created by Emmanuel Casanas Cruz on 7/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

public class Job: Decodable {
    var company : String
    var position : String
    var date : String
    var logo : String
    var jobDescr : String

    
    init(dictionary: Dictionary<String, AnyObject>) {
        company = dictionary["company"] as? String ?? ""
        position = dictionary["position"] as? String ?? ""
        date = dictionary["range_date"] as? String ?? ""
        logo = dictionary["logo"] as? String ?? ""
        jobDescr = dictionary["description"] as? String ?? ""
    }
}
