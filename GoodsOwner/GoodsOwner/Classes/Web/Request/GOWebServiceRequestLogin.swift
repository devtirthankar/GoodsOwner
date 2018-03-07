//
//  GOWebServiceRequestLogin.swift
//  GoodsOwner
//
//  Created by nabanita on 07/03/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation

class GORequestLogin: GOWebServiceRequest{
    init(manager : GOWebServiceManager, username : String, password: String, block : @escaping GOWSCompletionBlock) {
        super.init(manager: manager, block: block)
        httpMethod = HTTPMethod.post
        body?["email"] = username
        body?["password"] = password
        url = manager.baseURL + GOWebServiceURLEndPoints.login
    }
}
