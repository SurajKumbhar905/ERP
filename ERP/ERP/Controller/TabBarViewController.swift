//
//  TabBarViewController.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    @IBOutlet var tabBAr: UITabBar!
    
    static var Instance: TabBarViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TabBarViewController.Instance = self
        
        tabBAr.items?.first?.title = "Employee"
        tabBAr.items?[1].title = "Dashboard"
        tabBAr.items?[2].title = "Project"
        
        self.navigationController?.navigationBar.isHidden = true
        
        
        
        self.selectedIndex = 1
     

       }
    

        
       
        
    }

