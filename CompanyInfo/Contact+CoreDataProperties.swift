//
//  Contact+CoreDataProperties.swift
//  CompanyInfo
//
//  Created by Kris Minkjan on 4/7/16.
//  Copyright © 2016 Artemis Üncü. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contact {

    @NSManaged var name: String?
    @NSManaged var company: Company?
    @NSManaged var notes: NSSet?

}
