//
//  GOOrderDetailsItemCell.swift
//  GoodsOwner
//
//  Created by Nabanita on 14/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOOrderDetailsCell: UICollectionViewCell {
    
    @IBOutlet weak var _serialNo: UILabel!
    @IBOutlet weak var _productNo: UILabel!
    @IBOutlet weak var _productName: UILabel!
    @IBOutlet weak var _quantity: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
