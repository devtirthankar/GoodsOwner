//
//  GOUserProfile+Additions.swift
//  Goods
//
//  Created by nabanita on 01/05/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation
import CoreData

extension GOUserProfile {
    convenience init(dictionary: [String: Any], moc: NSManagedObjectContext?) {
        GOStorage.sharedStorage.deleteEntityFromDBEntityName("GOUserProfile")
        self.init(entity: NSEntityDescription.entity(forEntityName: "GOUserProfile", in: moc!)!, insertInto: moc!)
        self.name = dictionary["name"] as? String
        //TODO: mobile as string
        //self.mobile = (dictionary["mobile"] as? Int32)!
        if let mobileno = dictionary["mobile"] as? Int32 {
            self.mobile = mobileno
        }else{
            self.mobile = 0
        }
        if let cCode = dictionary["countrycode"] as? Int32 {
            self.countrycode = cCode
        }else{
            self.countrycode = 0
        }
    }
}
