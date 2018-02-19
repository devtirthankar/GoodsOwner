//
//  GOProductCell.swift
//  GoodsOwner
//
//  Created by Nabanita on 19/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productsView: UIView!
    @IBOutlet weak var deleteView: UIView!
    @IBOutlet weak var modifyView: UIView!
    
    @IBOutlet weak var checkBoxImage: UIImageView!
    
    var isCheckBoxPressed : Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func modifyButtonPressed(_ sender: UIButton) {
        
    }

}
