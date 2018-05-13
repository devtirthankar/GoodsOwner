//
//  GOLogin+Additions.swift
//  Goods
//
//  Created by nabanita on 01/05/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation
import CoreData

extension GOLogin {
    convenience init(dictionary: [String: Any], moc: NSManagedObjectContext?) {
        GOStorage.sharedStorage.deleteEntityFromDBEntityName("GOLogin")
        self.init(entity: NSEntityDescription.entity(forEntityName: "GOLogin", in: moc!)!, insertInto: moc!)
        self.token = dictionary["token"] as? String
        self.uuid = dictionary["uuid"] as? String
        
        let userProfile = GOUserProfile(dictionary: dictionary, moc: moc)
        self.user = userProfile
    }
    
    public static func loggedInUser() -> GOLogin?{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "GOLogin")
        weak var moc = GOStorage.sharedStorage.moc
        var entity : GOLogin? = nil
        moc?.performAndWait({
            do{
                let objects = try moc?.fetch(request) as? [GOLogin]
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
