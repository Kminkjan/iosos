//
//  CompanyDetailViewController.swift
//  CompanyInfo
//
//  Created by Kris Minkjan on 4/2/16.
//  Copyright © 2016 Artemis Üncü. All rights reserved.
//

import UIKit

class CompanyDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var model = Model.sharedInstance
    var company: Company?
    var isEdit = false

    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var companynameField: UITextField!
    @IBOutlet weak var telephoneField: UITextField!
    @IBOutlet weak var adresField: UITextField!
    @IBOutlet weak var contactTableView: UITableView!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var companyImageView: UIImageView!
    
    var imagePicker : UIImagePickerController!
    
    
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
            companyImageView.image = UIImage(data: company!.image!);
    
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
                model.addCompany(companynameField.text!, telephone:telephoneField.text!, adres:adresField.text!, image:UIImageJPEGRepresentation(companyImageView.image!, 1)!)
            } else {
                company?.name = companynameField.text!
                company?.telephone = telephoneField.text!
                company?.adres = adresField.text!
                company?.image = UIImageJPEGRepresentation(companyImageView.image!, 1)
            }
        } else {
            // Edit it
            isEdit = true
            editButton.title = "Save"
        }
        
        setEditingStatus()
    }
    
    
    @IBAction func photoButtonClick(sender: UIButton) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        companyImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    
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
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "ShowContactTable":
                let contactTableVC = segue.destinationViewController as! ContactTableViewController;
                contactTableVC.contacts = (company?.contacts)!
            default: break;
            }
        }
    }

}
