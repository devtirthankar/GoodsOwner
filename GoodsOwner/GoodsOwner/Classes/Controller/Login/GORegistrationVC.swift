//
//  GORegistrationVC.swift
//  GoodsOwner
//
//  Created by nabanita on 09/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit



class GORegistrationVC: GOBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GORegistrationIntermediateVC")
        self.navigationController?.pushViewController(controller!, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

