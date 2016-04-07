//
//  Model.swift
//  CompanyInfo
//
//  Created by Artemis Üncü on 15/03/16.
//  Copyright (c) 2016 Artemis Üncü. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class Model{
    static let sharedInstance = Model()
    
    let managedObjectContext:NSManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    var companyList:Array<Company>
    private init(){
//        let c1 = Company(name:"Kriscorp", telephone: " +31 527 893622", adres: "Awesomestreet")
//        let c2 = Company(name:"Saxion", telephone: " +31 527 893622", adres: "Awesomestreet")
//        let c3 = Company(name:"Artcorp", telephone: " +31 527 893622", adres: "Awesomestreet")
        let employeesFetch = NSFetchRequest(entityName: "Company")
        
        do {
            companyList = try managedObjectContext.executeFetchRequest(employeesFetch) as! [Company]
        } catch {
            fatalError("Failed to fetch companyList: \(error)")
        }
    }
    
    func getCompanies() -> Array<Company> {
        return self.companyList
    }
    
    func addCompany(name:String,telephone:String,adres:String,image:NSData){
        let newCompany = NSEntityDescription.insertNewObjectForEntityForName("Company", inManagedObjectContext: managedObjectContext) as! Company
        newCompany.name = name
        newCompany.image = image
        newCompany.setValue(telephone, forKey: "telephone")
        newCompany.setValue(adres, forKey: "adres")
        companyList.append(newCompany)
    }
    
    func editCompany(company:Company) {
        
    }
    
    func removeCompany(id:String){
//        if let index = companyList.indexOf({ $0.id == id }){
//            companyList.removeAtIndex(index)
//        }
    }

}