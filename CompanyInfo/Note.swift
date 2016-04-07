//
//  Note.swift
//  CompanyInfo
//
//  Created by Kris Minkjan on 4/7/16.
//  Copyright © 2016 Artemis Üncü. All rights reserved.
//

import Foundation
import CoreData


class Note: NSManagedObject {
    @NSManaged var message: String?
    @NSManaged var name: String?
    @NSManaged var contact: Contact?

// Insert code here to add functionality to your managed object subclass

}
