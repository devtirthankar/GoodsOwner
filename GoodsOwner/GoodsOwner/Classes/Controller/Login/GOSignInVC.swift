//
//  GOLoginVC.swift
//  GoodsOwner
//
//  Created by nabanita on 08/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation
import UIKit

class GOSignInVC: GOBaseVC,GOSignInVMDelegate {
    
    @IBOutlet weak var _signInButton: UIButton!
    @IBOutlet weak var _goodsOwnerLogo: UIImageView!
    @IBOutlet weak var _usernameTextField: UITextField!
    @IBOutlet weak var _passwordTextField: UITextField!
    var signInViewModel: GOSignInVM = GOSignInVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInViewModel.delegate = self
        setColorForTitleViews()
        setColorForLabels()
        initializeUI()
    }
    
    func initializeUI() {
        _signInButton.layer.cornerRadius = _signInButton.frame.height * 0.5
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        signInViewModel.username = _usernameTextField.text
        signInViewModel.password = _passwordTextField.text
        signInViewModel.onSignInPressed()
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GORegistrationVC")
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
    //MARK: GOSignInVMDelegate
    func showAlertForErrorType(_ type: GOSignInErrorType){
        switch type {
        case .invalidUsername:
            _usernameTextField.becomeFirstResponder()
            GOAlertAndLoader.showAlertMessage(type.rawValue)
        case .invalidPassword:
            _passwordTextField.becomeFirstResponder()
            GOAlertAndLoader.showAlertMessage(type.rawValue)
        default:
            print(type.rawValue)
        }
    }
    
    func didSignIn(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GOTabBarController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
