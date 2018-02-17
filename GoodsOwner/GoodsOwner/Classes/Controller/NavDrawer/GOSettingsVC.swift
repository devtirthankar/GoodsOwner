//
//  GOSettingsVC.swift
//  GoodsOwner
//
//  Created by nabanita on 11/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOSettingsVC: GOBaseVC {
    
    @IBOutlet var _buttons : [UIButton]?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let buttons = _buttons else{
            return
        }
        
        for button in buttons{
            button.layer.cornerRadius = button.frame.height * 0.5
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.colorForHex(GOColor.ThemeColor as NSString).cgColor
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        let _ = self.navigationController?.popViewController(animated: true)
    }

}
