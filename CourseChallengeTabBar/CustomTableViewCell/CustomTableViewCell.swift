//
//  CustomTableViewCell.swift
//  CourseChallengeTabBar
//
//  Created by Renato Vieira da Silva on 12/01/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoUserImageView: UIImageView!
    @IBOutlet weak var nameUserLabel: UILabel!
    
    static let identifier = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        configImageView()
    }
    
    private func configImageView() {
        photoUserImageView.contentMode = .scaleAspectFill
        photoUserImageView.layer.masksToBounds = true
        photoUserImageView.layer.cornerRadius = photoUserImageView.frame.height / 2
    }
    
    func setupCell(data: UserData) {
        nameUserLabel.text = data.name
        photoUserImageView.image = data.image
    }
    
//    func setupCell(_ nameUser: String, _ photoImage: UIImage) {
//        nameUserLabel.text = nameUser
//        photoUserImageView.image = photoImage
//    }
}
