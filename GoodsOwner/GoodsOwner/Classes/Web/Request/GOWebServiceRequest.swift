//
//  GOWebServiceRequest.swift
//  GoodsOwner
//
//  Created by nabanita on 07/03/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

class GOWebServiceRequest: NSObject{
    var block: GOWSCompletionBlock
    weak var manager : GOWebServiceManager?
    var url: String?
    var httpMethod : HTTPMethod = .get
    var headers = [String : String]()
    var body : [String: Any]?
    var dataTask : URLSessionDataTask?
    //var request : DataRequest?
    
    
    init(manager : GOWebServiceManager, block : @escaping GOWSCompletionBlock) {
        self.block = block
        self.manager = manager
    }
    
    func start(){
        guard let urlStr = url else{return}
        
        let session = URLSession.shared
        
        let encodedUrlStr = urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        var request = URLRequest(url: URL(string: encodedUrlStr!)!)
        request.httpMethod = httpMethod.rawValue
        
        if let body = body{
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        for (key,value) in headers{
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            /*
            guard error == nil else {
                return
            }*/
            
            guard let data = data else {
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("Request failed")
            }else{
                print("Request success")
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print(json)
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }

        })
        task.resume()
        dataTask = task
    }
    
    func stop(){
        
        if let task = self.dataTask{
            task.cancel()
            
        }
        
    }
}
