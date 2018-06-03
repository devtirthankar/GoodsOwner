//
//  GOOrderReceivedTableCell.swift
//  GoodsOwner
//
//  Created by nabanita on 02/06/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOOrderReceivedTableCell: UITableViewCell {
    
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var quantity: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
