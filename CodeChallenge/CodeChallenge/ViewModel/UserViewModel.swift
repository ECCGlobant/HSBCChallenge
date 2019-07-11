//
//  UserViewModel.swift
//  CodeChallenge
//
//  Created by Emmanuel Casanas Cruz on 7/9/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

protocol viewModelDelegate {
    func didLoadInfoSucces()
    func didLoadInfoFailed()
}


// MARK: - ViewModel
public class UserViewModel {
    
    var isEmpty = true
    var userName :String?
    var delegate : viewModelDelegate?
    var jobs : [Job] = []
    var info : infoResponse? {
        didSet{
            delegate?.didLoadInfoSucces()
        }
    }
    
     init(user:User) {
        self.isEmpty = false
        self.jobs = user.jobs
        self.userName = user.name
    }
    
    init () {
        
    }
    
    //Mark: Fetch information
    
    func getInformation () {
        ProgressView.shared.showProgressView()
        LibraryAPI.sharedInstance.getProfileInfo(Success: { (response) in
            ProgressView.shared.hideProgressView()
            DispatchQueue.main.async {
                self.info = response
            }
        }) { (error) in
            ProgressView.shared.hideProgressView()
            DispatchQueue.main.async {
                self.delegate?.didLoadInfoFailed()
            }
            print(error)
        }
    }
    
}

extension UserViewModel {
    public func setupView(_ view:LandingTableViewController) {
        view.profileImage.layer.cornerRadius = 60
        view.profileImage.clipsToBounds = true
        guard let selectedInfo = info else { return }
        view.name.text = selectedInfo.name
        view.currentRole.text = selectedInfo.jobTitle
        view.profileImage.downloaded(from: selectedInfo.pictureURL)
        isEmpty = false
        jobs = selectedInfo.jobs
        view.tableView.reloadData()
    }
    
    public func showEmptyScreen(_ view:LandingTableViewController) {
        view.tableView.setEmptyView(title: "EmptyViewTitle".localize() , message: "EmptyViewMessage".localize(), messageImage: UIImage(named: "profile_placeholder")!)
    }
}
