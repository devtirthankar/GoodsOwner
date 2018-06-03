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
    
    public static func loggedInUser() -> GOUserProfile?{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "GOUserProfile")
        weak var moc = GOStorage.sharedStorage.moc
        var entity : GOUserProfile? = nil
        moc?.performAndWait({
            do{
                let objects = try moc?.fetch(request) as? [GOUserProfile]
                if let objects = objects{
                    if objects.count > 0{
                        entity = objects.last
                    }
                }
            }catch{}
        })
        return entity
    }
}
