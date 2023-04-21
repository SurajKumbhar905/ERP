//
//  UICellExtention.swift
//  ERP
//
//  Created by Suraj on 19/04/23.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    func shadowDecorate(radius: CGFloat = 15,
                        shadowColor: UIColor = UIColor.black,
                           shadowOffset: CGSize = CGSize(width: 2, height: 4.0),
                        shadowRadius: CGFloat = 2,
                        shadowOpacity: Float = 0.5) {
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 0.1
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.masksToBounds = true
        
           layer.shadowColor = shadowColor.cgColor
           layer.shadowOffset = shadowOffset
           layer.shadowRadius = shadowRadius
           layer.shadowOpacity = shadowOpacity
           layer.masksToBounds = false
           layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
           layer.cornerRadius = radius
//        layer.shouldRasterize = true
//        layer.rasterizationScale = UIScreen.main.scale
       }
    
    func shadow(){
        contentView.layer.borderWidth = 0.1
//        contentView.backgroundColor = .clear
        layer.masksToBounds = false

         layer.shadowColor = UIColor.black.cgColor

        layer.shadowOpacity = 0.3

         layer.shadowRadius = 3

        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
}
