//
//  CompanyDetailViewController.swift
//  CompanyInfo
//
//  Created by Kris Minkjan on 4/2/16.
//  Copyright © 2016 Artemis Üncü. All rights reserved.
//

import UIKit

class CompanyDetailViewController: UIViewController {
    var model = Model.sharedInstance
    var company: Company?
    var isEdit = false

    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var companynameField: UITextField!
    @IBOutlet weak var telephoneField: UITextField!
    @IBOutlet weak var adresField: UITextField!
    @IBOutlet weak var contactTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        companynameField.text = company?.name
        telephoneField.text = company?.telephone
        adresField.text = company?.adres
        if (company == nil) {
            isEdit = true
            editButton.title = "Save"
        }
        
        if company != nil {
        let aap:ContactTableViewController = ContactTableViewController()
        aap.contacts = company?.contacts?.allObjects as! Array<Contact>
        aap.tableView = contactTableView
        
        
        contactTableView.delegate = aap ;
        contactTableView.dataSource = aap;
        }
        
        setEditingStatus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    

    @IBAction func editButtonClick(sender: AnyObject) {
        if isEdit {
            // Save it
            isEdit = false
            editButton.title = "Edit"
            
            
            if (company == nil) {
                company = Company()
                company?.name = companynameField.text!
                company?.telephone = telephoneField.text!
                company?.adres = adresField.text!
                model.addCompany(company!)
            } else {
                company?.name = companynameField.text!
                company?.telephone = telephoneField.text!
                company?.adres = adresField.text!
            }
        } else {
            // Edit it
            isEdit = true
            editButton.title = "Save"
        }
        
        setEditingStatus()
        
    }
    
    // MARK: - Helper functions
    
    func setEditingStatus() {
        companynameField.enabled = isEdit
        telephoneField.enabled = isEdit
        adresField.enabled = isEdit
        
        companynameField.borderStyle = isEdit ? UITextBorderStyle.RoundedRect : UITextBorderStyle.None
        telephoneField.borderStyle = isEdit ? UITextBorderStyle.RoundedRect : UITextBorderStyle.None
        adresField.borderStyle = isEdit ? UITextBorderStyle.RoundedRect : UITextBorderStyle.None
    }

}
