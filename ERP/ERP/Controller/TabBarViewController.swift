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
        
//        vc1.tabBarItem.image = UIImage(systemName: "mail.stack")
//        vc2.tabBarItem.image = UIImage(systemName: "person.3")
//        vc3.tabBarItem.image = UIImage(systemName: "square.3.layers.3d")
        tabBAr.items?.first?.image = UIImage(systemName: "person.3")
        tabBAr.items?[1].image = UIImage(systemName: "mail.stack")
        tabBAr.items?[2].image = UIImage(systemName: "square.3.layers.3d")
        
        tabBAr.tintColor = .label
        self.selectedIndex = 1
     

       }
    

        
       
        
    }


