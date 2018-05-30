//
//  GOLoginVC.swift
//  GoodsOwner
//
//  Created by nabanita on 08/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation
import UIKit

class GOSignInVC: GOBaseVC, GOSignInVMDelegate {
    
    @IBOutlet weak var _signInButton: UIButton!
    @IBOutlet weak var _mobile: UITextField!
    @IBOutlet weak var _password: UITextField!
    var signInViewModel: GOSignInVM = GOSignInVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInViewModel.delegate = self
        setColorForTitleViews()
        setColorForLabels()
        initializeUI()
        
        _mobile.text = "123456789"
        _password.text = "test1234"
    }
    
    func initializeUI() {
        _signInButton.layer.cornerRadius = _signInButton.frame.height * 0.5
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
//        didSignIn()
//        return
        signInViewModel.mobile = _mobile.text
        signInViewModel.password = _password.text
        signInViewModel.onSignInPressed()
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GORegistrationVC")
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
    //MARK: GOSignInVMDelegate
    func invalidInputDetected(_ message: String) {
        GOAlertAndLoader.showAlertMessage(message)
    }
    
    func didSignIn(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GOTabBarController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
