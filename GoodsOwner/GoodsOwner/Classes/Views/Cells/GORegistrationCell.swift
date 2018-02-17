//
//  GORegistrationCell.swift
//  GoodsOwner
//
//  Created by nabanita on 13/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GORegistrationCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
