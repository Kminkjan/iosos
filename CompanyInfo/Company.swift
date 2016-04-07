//
//  Company.swift
//  CompanyInfo
//
//  Created by Kris Minkjan on 4/7/16.
//  Copyright © 2016 Artemis Üncü. All rights reserved.
//

import Foundation
import CoreData


class Company: NSManagedObject {
    @NSManaged var adres: String?
    @NSManaged var name: String?
    @NSManaged var telephone: String?
    @NSManaged var contacts: NSSet?
// Insert code here to add functionality to your managed object subclass

}
