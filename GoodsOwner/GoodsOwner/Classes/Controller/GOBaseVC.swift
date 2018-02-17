//
//  GOBaseVC.swift
//  GoodsOwner
//
//  Created by Nabanita on 13/01/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOBaseVC: UIViewController {

    @IBOutlet var _themeView : [AnyObject]?
    @IBOutlet var _themeLabel : [UILabel]?
    func setColorForTitleViews(){
        
        guard let themeViews = _themeView else{
            return
        }
        
        for themeView in themeViews{
            
            let view = themeView as! UIView
            view.backgroundColor = UIColor.colorForHex(GOColor.ThemeColor as NSString)
            
            
        }
    }
    
    func setColorForLabels(){
        
        guard let themeLabels = _themeLabel else{
            return
        }
        
        for themeLabel in themeLabels{
            
            themeLabel.textColor = UIColor.colorForHex(GOColor.ThemeColor as NSString)
            
        }
    }

}
