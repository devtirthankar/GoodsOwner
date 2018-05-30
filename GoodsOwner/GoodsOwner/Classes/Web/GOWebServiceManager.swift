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
    static let registration = "user"
    static let login = "login"
    static let orderlist = "orders"
    static let countrylist = "countries"
    static let citylist = "cities"
    static let storecategorylist = "storecategories"
    static let imageurlproduction = "https://api.goods-dts.com"
    static let imageurldevelopment = "https://api.smj.ltd/"
}

enum GOServerURL: String {
    case development = "https://api.smj.ltd/api/v1/"
    case test = "test"
    case production = "https://api.goods-dts.com/"
    case staging = "http://www.goods-dts.com/goodsapp"
}

class GOWebServiceManager: NSObject {
    var serviceArray = [GOWebServiceRequest]()
    var baseURL = GOServerURL.production.rawValue
    var baseImageURL = GOWebServiceURLEndPoints.imageurlproduction
    
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
    
    func loginUser(mobile: String, password: String, block : @escaping GOWSCompletionBlock) {
        let service = GOLoginRequest.init(manager: self, mobile: mobile, password: password, block: block)
        self.startRequest(service: service)
    }
    
    func getOrderList(block : @escaping GOWSCompletionBlock) {
        let service = GOWebServiceOrderListRequest.init(manager: self, block: block)
        self.startRequest(service: service)
    }
    
    func getCountryList(block : @escaping GOWSCompletionBlock) {
        let service = GOWSCountryListRequest(manager: self, block: block)
        self.startRequest(service: service)
    }
    
    func getCityList(country: String, block : @escaping GOWSCompletionBlock) {
        let service = GOWSCityListRequest(manager: self, country: country, block: block)
        self.startRequest(service: service)
    }
    
    func getStoreCategoryList(block : @escaping GOWSCompletionBlock) {
        let service = GOWSStoreCategoryListRequest(manager: self, block: block)
        self.startRequest(service: service)
    }
}
