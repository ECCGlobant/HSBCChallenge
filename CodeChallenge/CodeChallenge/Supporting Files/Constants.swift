//
//  Constants.swift
//  CodeChallenge
//
//  Created by Emmanuel Casanas Cruz on 7/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

//URLConstants.swift

struct APPURL {
    
    private struct Domains {
        static let Dev = "https://gist.githubusercontent.com"
    }
    
    private  struct Routes {
        static let Api = "/ECCGlobant/449a792cf77fb78b8b2654a0247933ad/raw/"
    }
    
    private  static let Domain = Domains.Dev
    private  static let Route = Routes.Api
    private  static let BaseURL = Domain + Route
    
    static var apiBaseURL: String {
        return BaseURL
    }
}

struct CellIdentifier {
    
    private struct Collection {
        static let jobCell =  "Appcell"
        static let cellID = "cellID"
        static let tableViewID = "landingTableViewIdentifier"
        static let collectionViewID = "appCollectionViewIdentifier"
    }
    
    private static let cellIdentifier  = Collection.jobCell
    private static let cellIDAssistive  = Collection.cellID
    private static let tableViewIDAssistive  = Collection.tableViewID
    private static let collectionIDAssistive  = Collection.collectionViewID
    
    
    static var value: String {
        return cellIdentifier
    }
    
    static var assistiveCell: String {
        return cellIDAssistive
    }
    
    static var assistiveTable: String {
        return tableViewIDAssistive
    }
    
    static var assistiveCollection: String {
        return collectionIDAssistive
    }
    
}

struct SegueID {
    private struct Detail {
        static let DetailSegue =  "gotoDetail"
    }
      private static let segueIdentifier  = Detail.DetailSegue
    
    static var nameSegue : String {
        return segueIdentifier
    }
}
