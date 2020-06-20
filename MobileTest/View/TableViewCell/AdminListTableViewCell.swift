//
//  AdminListTableViewCell.swift
//  MobileTest
//
//  Created by macbook on 3/30/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import UIKit

class AdminListTableViewCell: UITableViewCell {
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.userImageView.layer.cornerRadius = self.userImageView.frame.width / 2
        self.userImageView.layer.masksToBounds = true
        // Initialization code
    }
    func fill(_ userModel:UserModel) {
        self.namelabel.text = userModel.fullName
        let image = UIImage(data: userModel.image)
        self.userImageView.image =  image
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
