//
//  ViewController.swift
//  GoodsOwner
//
//  Created by Nabanita on 13/01/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOSplashVC: GOBaseVC {
    
    @IBOutlet weak var _goodsOwnerLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setColorForTitleViews()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            //self.bringUpLoginView()
            if let _ = GOLogin.loggedInUser()?.token {
                self.bringUpDashboard()
            }else {
                self.bringUpLoginView()
            }
        }
    }
    
    func bringUpLoginView() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GOSignInVC")
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    func bringUpDashboard() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GOTabBarController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}

