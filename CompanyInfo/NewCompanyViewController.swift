//
//  NewCompanyViewController.swift
//  CompanyInfo
//
//  Created by Kris Minkjan on 3/31/16.
//  Copyright © 2016 Artemis Üncü. All rights reserved.
//

import UIKit

class NewCompanyViewController: UIViewController {
    
    var model = Model.sharedInstance
    
    @IBOutlet weak var companyNameField: UITextField!
    @IBOutlet weak var telephoneField: UITextField!
    @IBOutlet weak var streetField: UITextField!
    @IBOutlet weak var housenumberField: UITextField!
    @IBOutlet weak var zipcodeField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createCompany(sender: UIButton) {
//        model.addCompany(Company(name:companyNameField.text!, telephone: telephoneField.text!, adres: streetField.text!))
    }
}