//
//  EmployeeEditViewController.swift
//  ERP
//
//  Created by Suraj on 11/04/23.
//

import UIKit

class EmployeeEditViewController: UIViewController {

    @IBOutlet var BlurView: UIView!
    
    @IBOutlet var editView: UIView!
    
    @IBOutlet var hederViewOfEdit: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        BlurView.isHidden = true
        editView.backgroundColor = .white
        editView.clipsToBounds = true
        editView.layer.cornerRadius = 15
       
       
      
      
        
        
        let statusTap = UITapGestureRecognizer(target: self, action: #selector(self.blurViewTapHandle(_:)))
        BlurView.addGestureRecognizer(statusTap)
    }
    
    
    
    @objc func blurViewTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        BlurView.isHidden = true
        if let parentVC = parent as? EmployeeViewController {
                    parentVC.dismissChildViewController()
                }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
