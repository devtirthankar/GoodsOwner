//
//  GODeleteProductVC.swift
//  GoodsOwner
//
//  Created by nabanita on 12/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GODeleteProductVC: GOBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        let _ = self.navigationController?.popViewController(animated: true)
    }

}
