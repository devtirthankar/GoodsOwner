//
//  GDWebServiceManager.swift
//  Goods
//
//  Created by nabanita on 25/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation

typealias GOWSCompletionBlock = (_ object : Any?, _ error : Error?) -> Void

enum GOWebServiceURLEndPoints{
    static let registration = "/register"
    static let login = "/login"
}

enum GOServerURL: String {
    case development = "development"
    case test = "test"
    case production = "production"
    case staging = "http://www.goods-dts.com/goodsapp"
}

class GOWebServiceManager: NSObject {
    var serviceArray = [GOWebServiceRequest]()
    var baseURL = GOServerURL.staging.rawValue
    
    static let sharedManager : GOWebServiceManager = {
        let instance = GOWebServiceManager()
        return instance
    }()
    
    func startRequest(service : GOWebServiceRequest){
        service.start()
        serviceArray.append(service)
        print("services started = \(self.serviceArray.count)")
    }
    
    func stopRequest(service : GOWebServiceRequest){
        service.stop()
    }
    
    func closeService(service : GOWebServiceRequest?){
        guard service != nil else{
            return
        }
        /*
        if self.serviceArray.contains(service!) == true{
            self.serviceArray.remove(object: service!)
        }*/
        print("service pending = \(self.serviceArray.count)")
    }
    
}

extension GOWebServiceManager{
    
    func loginUser(username: String, password: String, block : @escaping GOWSCompletionBlock) {
        
        let service = GORequestLogin.init(manager: self, username: username, password: password, block: block)
        self.startRequest(service: service)
 
    }
    
}
