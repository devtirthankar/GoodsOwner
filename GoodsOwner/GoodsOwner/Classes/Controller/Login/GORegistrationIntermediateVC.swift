//
//  GORegistrationIntermediateVC.swift
//  GoodsOwner
//
//  Created by nabanita on 16/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GORegistrationIntermediateVC: GOBaseVC {
    
    @IBOutlet weak var checkBoxImage: UIImageView!
    var isCheckBoxPressed : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GOTabBarController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        
        if isCheckBoxPressed {
            isCheckBoxPressed = false
            checkBoxImage.image = UIImage.init(named: "checkboxUns")
        }
        else {
            isCheckBoxPressed = true
            checkBoxImage.image = UIImage.init(named: "checkboxSel")
        }
        
    }

}
