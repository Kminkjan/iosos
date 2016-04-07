//
//  Company+CoreDataProperties.swift
//  CompanyInfo
//
//  Created by Kris Minkjan on 4/3/16.
//  Copyright © 2016 Artemis Üncü. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Company {

    @NSManaged var adres: String?
    @NSManaged var name: String?
    @NSManaged var telephone: String?
    @NSManaged var contacts: NSSet?

}
