//
//  GOLogin+CoreDataProperties.swift
//  GoodsOwner
//
//  Created by nabanita on 09/05/18.
//  Copyright © 2018 company. All rights reserved.
//
//

import Foundation
import CoreData


extension GOLogin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GOLogin> {
        return NSFetchRequest<GOLogin>(entityName: "GOLogin")
    }

    @NSManaged public var token: String?
    @NSManaged public var uuid: String?
    @NSManaged public var user: GOUserProfile?

}
