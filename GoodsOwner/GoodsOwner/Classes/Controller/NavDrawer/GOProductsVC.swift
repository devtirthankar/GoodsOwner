//
//  GOProductsVC.swift
//  GoodsOwner
//
//  Created by nabanita on 11/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOProductsVC: GOBaseVC {
    
    @IBOutlet var _productButtons : [UIButton]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let productButtons = _productButtons else{
            return
        }
        
        /*
        for button in productButtons{
            button.layer.cornerRadius = button.frame.height * 0.5
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.colorForHex(GOColor.ThemeColor as NSString).cgColor
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    @IBAction func backButtonPressed(_ sender: UIButton){
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func productButtonsPressed(_ sender: UIButton){
        
        var buttonIndex = 0
        for i in 0..<_productButtons!.count {
            let bttn = _productButtons![i]
            if bttn == sender {
                buttonIndex = i
                break
            }
        }
        
        switch buttonIndex {
        case 0:
            bringupAddProductsScreen()
        case 1:
            bringupDeleteProductsScreen()
        case 2:
            bringupModifyProductsScreen()
        case 3:
            bringupOutOfStockScreen()
        default:
            bringupMyProductsScreen()
        }
        
    }
    
    func bringupAddProductsScreen() {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GOAddProductVC")
        controller!.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
    func bringupDeleteProductsScreen() {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GODeleteProductVC")
        controller!.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
    func bringupModifyProductsScreen() {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GOModifyProductVC")
        controller!.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
    func bringupOutOfStockScreen() {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GOOutOfStockVC")
        controller!.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
    func bringupMyProductsScreen() {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GOMyProductVC")
        controller!.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller!, animated: true)
    }

}
