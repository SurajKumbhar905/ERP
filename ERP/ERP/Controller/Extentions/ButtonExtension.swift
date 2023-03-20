//
//  ButtonExtension.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import Foundation
import UIKit


extension UIButton{
    
    func addButtonAttribute(buttonText: String , conrnerRedius: CGFloat , backGroundColor: UIColor , buttonTextColor: UIColor , buttonTextFont : CGFloat)
    {
        let button = self
        button.setTitle(buttonText, for: .normal)
        button.layer.cornerRadius = conrnerRedius
        button.backgroundColor = backGroundColor
        button.setTitleColor(buttonTextColor, for: .normal)
        button.tintColor = buttonTextColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.systemFont(ofSize: buttonTextFont, weight: .semibold)
        
    }
}
