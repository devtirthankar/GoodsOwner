//
//  GOUserProfile+CoreDataProperties.swift
//  GoodsOwner
//
//  Created by nabanita on 09/05/18.
//  Copyright © 2018 company. All rights reserved.
//
//

import Foundation
import CoreData


extension GOUserProfile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GOUserProfile> {
        return NSFetchRequest<GOUserProfile>(entityName: "GOUserProfile")
    }

    @NSManaged public var countrycode: Int32
    @NSManaged public var mobile: Int32
    @NSManaged public var name: String?
    @NSManaged public var login: GOLogin?

}
