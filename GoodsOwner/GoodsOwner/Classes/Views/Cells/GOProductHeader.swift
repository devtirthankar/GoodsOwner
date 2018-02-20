//
//  GOProductHeader.swift
//  GoodsOwner
//
//  Created by Nabanita on 19/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOProductHeader: UICollectionReusableView {
    
    @IBOutlet weak var column1Label: UILabel!
    @IBOutlet weak var column2Label: UILabel!
    @IBOutlet weak var column3Label: UILabel!
    
    let deleteProductsHeaderList = ["Product #", "Name", "Select"]
    let modifyProductsHeaderList = ["Product #", "Name", "Tab to modify"]
    let myProductsHeaderList = ["Serial #", "Product #", "Name"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureDeleteProductsHeaderList() {
        column1Label.text = NSLocalizedString(deleteProductsHeaderList[0], comment: "")
        column2Label.text = NSLocalizedString(deleteProductsHeaderList[1], comment: "")
        column3Label.text = NSLocalizedString(deleteProductsHeaderList[2], comment: "")
    }
    
    func configureModifyProductsHeaderList() {
        column1Label.text = NSLocalizedString(modifyProductsHeaderList[0], comment: "")
        column2Label.text = NSLocalizedString(modifyProductsHeaderList[1], comment: "")
        column3Label.text = NSLocalizedString(modifyProductsHeaderList[2], comment: "")
    }
    
    func configureMyProductsHeaderList() {
        column1Label.text = NSLocalizedString(myProductsHeaderList[0], comment: "")
        column2Label.text = NSLocalizedString(myProductsHeaderList[1], comment: "")
        column3Label.text = NSLocalizedString(myProductsHeaderList[2], comment: "")
    }
    
}
