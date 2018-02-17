//
//  GOLoginVC.swift
//  GoodsOwner
//
//  Created by nabanita on 08/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation
import UIKit

class GOSignInVC: GOBaseVC {
    
    @IBOutlet weak var _signInButton: UIButton!
    @IBOutlet weak var _goodsOwnerLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setColorForTitleViews()
        setColorForLabels()
        initializeUI()
    }
    
    func initializeUI() {
        
        _signInButton.layer.cornerRadius = _signInButton.frame.height * 0.5
        //_goodsLogo.image = myImageView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        _goodsOwnerLogo.image = _goodsOwnerLogo.image!.withRenderingMode(.alwaysTemplate)
        _goodsOwnerLogo.tintColor = UIColor.colorForHex(GOColor.ThemeColor as NSString)//UIColor.init(red: 255.0/255.0, green: 112.0/255.0, blue: 67.0/255.0, alpha: 1.0)//UIColor.colorForHex(GDColor.ThemeColor as NSString)//UIColor.init(red: 41.0/255.0, green: 190.0/255.0, blue: 136.0/255.0, alpha: 1.0)
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        
        //--GDLocationManager.sharedManager
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GOTabBarController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GORegistrationVC")
        self.navigationController?.pushViewController(controller!, animated: true)
    }
}
