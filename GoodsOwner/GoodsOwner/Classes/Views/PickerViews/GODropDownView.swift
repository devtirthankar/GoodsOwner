//
//  GODropDownView.swift
//  GoodsOwner
//
//  Created by Nabanita on 21/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

protocol GODropDownViewDelegate {
    func donePressed()
}

class GODropDownView: UIView {
    
    @IBOutlet weak var _headerTitle: UILabel!
    @IBOutlet weak var _pickerView: UIPickerView!
    
    var delegate: GODropDownViewDelegate?
    var selectedPickerValue: String?
    
    var pickerDataSource = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) { 
        delegate?.donePressed()
    }

}

extension GODropDownView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row] as String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerDataSource[row])
        selectedPickerValue = pickerDataSource[row]
    }
}
