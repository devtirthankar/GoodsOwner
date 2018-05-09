//
//  GOWebServiceRequestLogin.swift
//  GoodsOwner
//
//  Created by nabanita on 07/03/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation
import Alamofire

class GORequestLogin: GOWebServiceRequest{
    init(manager : GOWebServiceManager, username : String, password: String, block : @escaping GOWSCompletionBlock) {
        super.init(manager: manager, block: block)
        httpMethod = HTTPMethod.post
        body?["email"] = username
        body?["password"] = password
        url = manager.baseURL + GOWebServiceURLEndPoints.login
    }
}

class GOWSRegistrationRequest: GOWebServiceRequest {
    
    init(manager : GOWebServiceManager, name : String, email: String, password: String, phone: String, countrycode: String, block : @escaping GOWSCompletionBlock) {
        super.init(manager: manager, block: block)
        httpMethod = HTTPMethod.post
        url = manager.baseURL + GOWebServiceURLEndPoints.registration
        body?["name"] = name
        body?["email"] = email
        body?["password"] = password
        body?["mobile"] = phone
        body?["countrycode"] = countrycode
        body?["type"] = "STORE_OWNER"
    }
}

class GOWSOTPValidationRequest: GOWebServiceRequest {
    init(manager: GOWebServiceManager, otp: String, block: @escaping GOWSCompletionBlock) {
        super.init(manager: manager, block: block)
        httpMethod = HTTPMethod.post
        url = manager.baseURL + GOWebServiceURLEndPoints.login
        body?["code"] = otp
        //body?["uuid"] = GOLogin.loggedInUser()?.uuid
    }
}
