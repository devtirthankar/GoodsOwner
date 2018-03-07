//
//  GOSignInVM.swift
//  GoodsOwner
//
//  Created by nabanita on 05/03/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation

enum GOSignInErrorType:String{
    case invalidUsername = "Please enter a valid username"
    case invalidPassword = "Please enter a valid password"
    case loginFailed = "Login Failed"
}

protocol GOSignInVMDelegate{
    func showAlertForErrorType(_ type: GOSignInErrorType)
    func didSignIn()
}
class GOSignInVM{
    var username: String?
    var password: String?
    var delegate: GOSignInVMDelegate?
    
    func onSignInPressed() {
        var errorType: GOSignInErrorType?
        if username?.count == 0{
            errorType = .invalidUsername
        }else if password?.count == 0{
            errorType = .invalidPassword
        }
        if let eType = errorType{
            delegate?.showAlertForErrorType(eType)
        }else{
            signInUser()
        }
    }
    
    private func signInUser() {
        GOWebServiceManager.sharedManager.loginUser(username: username!, password: password!, block: {(response,error)in
            
        })
        //delegate?.didSignIn()
    }
}
