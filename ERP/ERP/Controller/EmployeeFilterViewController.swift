//
//  EmployeeFilterViewController.swift
//  ERP
//
//  Created by Suraj on 21/03/23.
//

import UIKit

class EmployeeFilterViewController: UIViewController {

    @IBOutlet var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        testView.backgroundColor = .white
        
        testView.layer.cornerRadius = 25
        

    }
    


    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        guard let touchLocation = touches.first?.location(in: self.view) else { return }
        
        if self.testView.frame.contains(touchLocation) {
            return
        }else{
            dismiss(animated: true, completion: nil)
        }
    }
    
    

}
