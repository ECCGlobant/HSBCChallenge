//
//  DetailViewController.swift
//  CodeChallenge
//
//  Created by Emmanuel Casanas Cruz on 7/9/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedJob: Job?

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var roleTitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var descriptionTxt: UITextView!
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        guard let job = selectedJob else {return}
        logoImage.downloaded(from: job.logo)
        companyName.text = job.company
        roleTitle.text = job.position
        date.text = job.date
        descriptionTxt.text = job.jobDescr
        dismissButton.setTitle("dismiss_text".localize(), for: .normal)
    }

}
