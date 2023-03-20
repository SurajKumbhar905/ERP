//
//  EmployeeViewController.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import UIKit

class EmployeeViewController: BaseViewController {
    
    let button = UIButton(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Employee"
        
        // Do any additional setup after loading the view.
      
    }
    
  
    
    override func viewWillAppear(_ animated: Bool) {
      
       setupNAvigationToMainScreen()
        }
    
    
    
//    func setNavigationBar() {
//
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        let imageView = UIImageView(frame: CGRect(x: 20, y: 10, width: 20, height: 30))
//
//        if let imgBackArrow = UIImage(named: "backArrow") {
//            imageView.image = imgBackArrow
//        }
//        view.addSubview(imageView)
//        let backTap = UITapGestureRecognizer(target: self, action: #selector(backToMain))
//        view.addGestureRecognizer(backTap)
//
//        let a = navigationItem.title
//        self.navigationItem.setHidesBackButton(true, animated: true)
//        let leftBarButtonItem = UIBarButtonItem(customView: view ?? UIView())
//        self.navigationItem.leftBarButtonItem = leftBarButtonItem
//    }
    
    
    
//    @objc func backToMain() {
//            self.navigationController?.popViewController(animated: true)
//    }
    

        
    }
    

 

