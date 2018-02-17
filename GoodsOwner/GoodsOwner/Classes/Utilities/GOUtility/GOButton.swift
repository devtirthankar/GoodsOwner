//
//  GOButton.swift
//  GoodsOwner
//
//  Created by nabanita on 13/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height * 0.5
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.colorForHex(GOColor.ThemeColor as NSString).cgColor
    }
}
