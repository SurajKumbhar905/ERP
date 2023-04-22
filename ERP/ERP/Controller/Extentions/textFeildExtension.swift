//
//  textFeildExtension.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import Foundation
import UIKit

extension UITextField{
    
    func addTextFieldAttriute(placeholder: String , backgroundColor: UIColor , cornerRedius: CGFloat){
        
        let textField = self
        
        textField.placeholder = placeholder
        textField.backgroundColor = backgroundColor
        textField.layer.cornerRadius = cornerRedius
        textField.layer.masksToBounds = false
        textField.clipsToBounds = true
        
    }
    
    
    func paddingLeft(inset: CGFloat){
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: inset, height: self.frame.height))
        self.leftViewMode = UITextField.ViewMode.always
    }
    
}
