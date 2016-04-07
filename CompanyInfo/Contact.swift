//
//  Contact.swift
//  CompanyInfo
//
//  Created by Kris Minkjan on 4/7/16.
//  Copyright © 2016 Artemis Üncü. All rights reserved.
//

import Foundation
import CoreData


class Contact: NSManagedObject {
    @NSManaged var name: String?
    @NSManaged var company: Company?
    @NSManaged var notes: NSSet?
    
 
// Insert code here to add functionality to your managed object subclass

}
