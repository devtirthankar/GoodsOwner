//
//  GOWebServiceRequestLogin.swift
//  GoodsOwner
//
//  Created by nabanita on 07/03/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation
import Alamofire

struct Countries: Decodable {
    let result: [Country]?
}

struct Country: Decodable {
    let countryname: String
    let countrynamear: String
}

struct Cities: Decodable {
    let result: [City]?
}

struct City: Decodable {
    let cityname: String
    let citynamear: String
}

struct StoreCategories: Decodable {
    let result: [StoreCategory]?
}

struct StoreCategory: Decodable {
    let storecategoryname: String
    let storecategorynamear: String
}

class GOLoginRequest: GOWebServiceRequest{
    init(manager : GOWebServiceManager, mobile : String, password: String, block : @escaping GOWSCompletionBlock) {
        super.init(manager: manager, block: block)
        httpMethod = HTTPMethod.post
        body?["mobile"] = mobile
        body?["password"] = password
        url = manager.baseURL + GOWebServiceURLEndPoints.login
    }
    
    override func responseSuccess(data: Data?) {
        guard let data = data else {
            return
        }
        var json = [String: Any]()
        do {
            json = (try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any])!
            
        } catch {
            print("Something went wrong")
        }
        print("\(json)")
        
        var loginInfo: GOLogin?
        //if let json = data as? [String: Any]{
        if let info = json["result"] as? [String: Any] {
            let moc = GOStorage.sharedStorage.moc
            moc?.performAndWait {
                loginInfo = GOLogin(dictionary: info, moc: moc)
            }
            GOStorage.sharedStorage.saveMOCToStorage()
        }
        //}
        super.responseSuccess(data: data)
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

class GOWSCountryListRequest: GOWebServiceRequest {
    override init(manager: GOWebServiceManager, block: @escaping GOWSCompletionBlock) {
        super.init(manager: manager, block: block)
        httpMethod = HTTPMethod.get
        url = manager.baseURL + GOWebServiceURLEndPoints.countrylist
    }
}

class GOWSCityListRequest: GOWebServiceRequest {
    init(manager: GOWebServiceManager, country: String, block: @escaping GOWSCompletionBlock) {
        super.init(manager: manager, block: block)
        httpMethod = HTTPMethod.get
        url = manager.baseURL + "country/\(country)/" + GOWebServiceURLEndPoints.citylist
    }
}

class GOWSStoreCategoryListRequest: GOWebServiceRequest {
    override init(manager: GOWebServiceManager, block: @escaping GOWSCompletionBlock) {
        super.init(manager: manager, block: block)
        httpMethod = HTTPMethod.get
        url = manager.baseURL + GOWebServiceURLEndPoints.storecategorylist
    }
}
