//
//  GOTabBarController.swift
//  GoodsOwner
//
//  Created by nabanita on 09/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOTabBarController: UITabBarController, GONavDrawerDelegate {
    
    var _fadedBackgroundView: UIView!
    var _navDrawerVC: GONavDrawerVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _navDrawerVC = self.storyboard?.instantiateViewController(withIdentifier: "GONavDrawerVC") as! GONavDrawerVC
        _navDrawerVC.delegate = self
        
        _fadedBackgroundView = UIView()
        _fadedBackgroundView.frame = self.view.bounds;
        _fadedBackgroundView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.8)
    }
    
    
    func openDrawer() {
        self.addChildViewController(_navDrawerVC)
        _navDrawerVC.beginAppearanceTransition(true, animated: true)
        
        let navDrawerWidth = self.view.frame.width * 0.75
        var yaxis: CGFloat
        
        _navDrawerVC.view.frame = CGRect(x: -navDrawerWidth, y: 0, width: -navDrawerWidth, height: self.view.frame.height)
        yaxis = 0;
        
        _fadedBackgroundView.alpha = 0.0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.addSubview(self._fadedBackgroundView)
            self.view.addSubview(self._navDrawerVC.view)
            self._navDrawerVC.view.frame = CGRect(x: yaxis, y: 0, width: navDrawerWidth, height: self.view.frame.height)
            self._fadedBackgroundView.alpha = 1.0
        }, completion: {(finished) in
            self._navDrawerVC.endAppearanceTransition()
            self._navDrawerVC.didMove(toParentViewController: self)
        })
    }
    
    func closeDrawer(){
        _navDrawerVC.willMove(toParentViewController: nil)
        _navDrawerVC.beginAppearanceTransition(false, animated: true)
        
        let navDrawerWidth = self.view.frame.width * 0.75
        let navDrawerFrame  = CGRect(x: -navDrawerWidth, y: 0, width: -navDrawerWidth, height: self.view.frame.height)
        
        UIView.animate(withDuration: 0.5, animations: {
            self._fadedBackgroundView.alpha = 0.0
            self._navDrawerVC.view.frame = navDrawerFrame;
        }, completion: {(finished) in
            self._navDrawerVC.endAppearanceTransition()
            self._navDrawerVC.view .removeFromSuperview()
            self._fadedBackgroundView.removeFromSuperview()
            self._navDrawerVC.removeFromParentViewController()
        })
        
    }
    
    //MARK: GDNavDrawerDelegate
    func didSelectCloseDrawer(){
        self.closeDrawer()
    }
    
    func didSelectItemType (_ type: NavDrawerItemType) {
        self.closeDrawer()
        switch (type){
            //case .home:
        //break
        case .products:
            let storyboard = UIStoryboard(name: "Products", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "GOProductsVC")
            controller.hidesBottomBarWhenPushed = true
            let navcon = self.selectedViewController as! UINavigationController;
            navcon.pushViewController(controller, animated: true);
            
        case .profile:
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "GOProfileVC")
            controller.hidesBottomBarWhenPushed = true
            let navcon = self.selectedViewController as! UINavigationController;
            navcon.pushViewController(controller, animated: true);
            
        case .settings:
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "GOSettingsVC")
            controller.hidesBottomBarWhenPushed = true
            let navcon = self.selectedViewController as! UINavigationController;
            navcon.pushViewController(controller, animated: true);
            
        case .logout:
            logoutuser()
        }
    }
    
    func logoutuser() {
        DispatchQueue.main.async {
            GOStorage.sharedStorage.deleteEntityFromDBEntityName("GOLogin")
            GOStorage.sharedStorage.deleteEntityFromDBEntityName("GOUserProfile")
            let viewControllers: [UIViewController] = self.navigationController!.viewControllers
            for aViewController in viewControllers {
                if(aViewController is GOSignInVC){
                    self.navigationController!.popToViewController(aViewController, animated: true)
                    return
                }
            }
        }
    }
    
    func bringUpMyCartScreen() {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for var touch in touches {
            if (touch.view?.isEqual(_fadedBackgroundView))!{
                closeDrawer()
            }
        }
    }
    
}
