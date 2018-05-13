//
//  GOWebServiceOrderRequest.swift
//  GoodsOwner
//
//  Created by nabanita on 09/05/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation
import Alamofire

struct Orders: Decodable {
    let result: [Order]
}

struct Order: Decodable {
    let orderid: Int64
    let orderstatus: Orderstatus?
    let quantity: Int?
    let userinfo: Userinfo?
    let product: Product
}

struct Orderstatus: Decodable {
    let orderstatusname: String?
    let orderstatusnamear: String?
}

struct Userinfo: Decodable {
    let mobile: String?
    let name: String?
}

struct Product: Decodable, Equatable {
    let price: Float32?
    let productcategory: ProductCategory?
    let productdescription: String?
    let productid: Int64
    let productimages: [ProductImage]?
    let productname: String?
    let productnamear: String?
    let productstatus: ProductStatus?
    let quantity: Int32?
    let serialnumber: String?
    let storeInfo: StoreInfo?
    
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.productid == rhs.productid
    }
}

struct ProductCategory: Decodable {
    let productcategoryname: String
    let productcategorynamear: String
}

struct ProductImage: Decodable {
    let imgpath: URL
}

struct ProductStatus: Decodable {
    let productstatusname: String
    let productstatusnamear: String
}

struct StoreInfo: Decodable {
    let delivery: Bool
    let storeid: Int64
    let storename: String
    let storenamear: String
}

class GOWebServiceOrderListRequest: GOWebServiceRequest{
    override init(manager : GOWebServiceManager, block : @escaping GOWSCompletionBlock) {
        super.init(manager: manager, block: block)
        httpMethod = HTTPMethod.get
        headers?["Authorization"] = "\((GOLogin.loggedInUser()?.token)!)"
        url = manager.baseURL + GOWebServiceURLEndPoints.orderlist
    }
}
