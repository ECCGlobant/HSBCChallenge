//
//  User.swift
//  CodeChallenge
//
//  Created by Emmanuel Casanas Cruz on 7/9/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

struct User: Decodable {
    
    let name: String
    let currentJob: String
    let pictureUrl: String
    let jobs: [Job]

}
