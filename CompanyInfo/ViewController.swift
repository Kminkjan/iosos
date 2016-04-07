//
//  ViewController.swift
//  CompanyInfo
//
//  Created by Artemis Üncü on 15/03/16.
//  Copyright (c) 2016 Artemis Üncü. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btn: UIButton!
    var model = Model.sharedInstance

    
    override func viewWillAppear(animated: Bool) {
        print("View appeared")
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print("View loaded")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Company Cell", forIndexPath: indexPath)
        
        let company = model.getCompanies()[indexPath.row]
        
        cell.textLabel?.text = company.name
        print("Makin a c-cell, \(indexPath), \(company.name)")
        
        // Configure the cell...
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getCompanies().count	
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "ShowCompanyDetail":
                    let companyDetailVC = segue.destinationViewController as! CompanyDetailViewController;
                    if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                        print("Inderpath section: \(indexPath.section) row: \(indexPath.row)")
                        companyDetailVC.company = model.getCompanies()[indexPath.row]
                    }
                
                default: break;
            }
        }
    }
}

