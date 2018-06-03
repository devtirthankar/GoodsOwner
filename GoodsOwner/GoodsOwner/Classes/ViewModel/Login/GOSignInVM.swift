//
//  GOSignInVM.swift
//  GoodsOwner
//
//  Created by nabanita on 05/03/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation

protocol GOSignInVMDelegate{
    func invalidInputDetected(_ message: String)
    func didSignIn()
}
class GOSignInVM{
    var mobile: String?
    var password: String?
    var delegate: GOSignInVMDelegate?
    
    func onSignInPressed() {
        var message: String = ""
        if mobile?.count == 0{
            message = GOErrorAlertMessage.emptyMobile
        }else if password?.count == 0{
            message = GOErrorAlertMessage.emptyPassword
        }else{
            signInUser()
        }
    }
    
    private func signInUser() {
        GOAlertAndLoader.showLoading()
        GOWebServiceManager.sharedManager.loginUser(mobile: mobile!, password: password!, block: {(response,error)in
            GOAlertAndLoader.hideLoading()
            if let err = error {
                self.delegate?.invalidInputDetected(err.localizedDescription)
            }
            else {
                self.delegate?.didSignIn()
            }
        })
        //delegate?.didSignIn()
    }
}
