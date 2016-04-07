//
//  ViewController.swift
//  CompanyInfo
//
//  Created by Artemis Üncü on 15/03/16.
//  Copyright (c) 2016 Artemis Üncü. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btn: UIButton!
    var model = Model.sharedInstance
    var companies = [Company]()
    var filteredCompanies = [Company]()
    
    var resultSearchController = UISearchController()
    
    override func viewWillAppear(animated: Bool) {
        print("View appeared")
        companies = model.getCompanies()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companies = model.getCompanies()

        tableView.delegate = self
        tableView.dataSource = self
        print("View loaded")
        // Do any additional setup after loading the view, typically from a nib.
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        // Reload the table
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Company Cell", forIndexPath: indexPath)
        
        var company:Company
        
        if (self.resultSearchController.active) {
            company = filteredCompanies[indexPath.row]
            
        }
        else {
            company = companies[indexPath.row]
            
        }
        
        
        cell.textLabel?.text = company.name
        print("Makin a c-cell, \(indexPath), \(company.name)")
        
        // Configure the cell...
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.resultSearchController.active) {
            return filteredCompanies.count
        }
        else {
            return companies.count
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Search 
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filteredCompanies.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF.name CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (companies as NSArray).filteredArrayUsingPredicate(searchPredicate)
        filteredCompanies = array as! [Company]
        
    
        
        self.tableView.reloadData()
    }
    
    deinit{
        if let superView = resultSearchController.view.superview
        {
            superView.removeFromSuperview()
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "ShowCompanyDetail":
                    let companyDetailVC = segue.destinationViewController as! CompanyDetailViewController;
                    if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                        print("Inderpath section: \(indexPath.section) :  row: \(indexPath.row)")
                        print(" HELP", model.getCompanies()[indexPath.row])
                        companyDetailVC.company = model.getCompanies()[indexPath.row]
                    }
                
                default: break;
            }
        }
    }
}

