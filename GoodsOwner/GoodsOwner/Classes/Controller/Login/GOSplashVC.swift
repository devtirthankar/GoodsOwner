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
        
        _goodsOwnerLogo.image = _goodsOwnerLogo.image!.withRenderingMode(.alwaysTemplate)
        _goodsOwnerLogo.tintColor = UIColor.colorForHex(GOColor.ThemeColor as NSString)//init(red: 41.0/255.0, green: 190.0/255.0, blue: 136.0/255.0, alpha: 1.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.bringUpLoginView()
        }
    }
    
    func bringUpLoginView() {
        
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GOSignInVC")
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

