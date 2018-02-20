//
//  GOProfileGeneralVC.swift
//  GoodsOwner
//
//  Created by nabanita on 20/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOProfileGeneralVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("General View Controller Will Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("General View Controller Will Disappear")
    }

}
