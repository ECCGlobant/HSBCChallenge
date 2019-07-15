//
//  AppCellCollectionViewCell.swift
//  CodeChallenge
//
//  Created by Emmanuel Casanas Cruz on 7/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class AppCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var appView: UIView!
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        appView.layer.cornerRadius = 20
        appView.clipsToBounds = true
        companyLogo.layer.cornerRadius = 40
        companyLogo.clipsToBounds = true
        self.isAccessibilityElement = true
    }
    
    public func configure(with model: Job) {
        companyLogo.downloaded(from: model.logo)
        companyName.text = model.company
        date.text = model.date
        position.text = model.position
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
