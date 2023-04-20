//
//  UiViewExtention.swift
//  ERP
//
//  Created by Suraj on 22/03/23.
//

import Foundation
import UIKit

extension UIView {

    var safeAreaBottom: CGFloat {
         if #available(iOS 11, *) {
            if let window = UIApplication.shared.keyWindowInConnectedScenes {
                return window.safeAreaInsets.bottom
            }
         }
         return 0
    }

    var safeAreaTop: CGFloat {
         if #available(iOS 11, *) {
            if let window = UIApplication.shared.keyWindowInConnectedScenes {
                return window.safeAreaInsets.top
            }
         }
         return 0
    }
    
    
    
    func setUpemployeeDetailCard(){
        
        let view = self
        view.backgroundColor = UIColor.employeeCard.mainCard
        view.layer.cornerRadius = 15
        
    }
    
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.3, radius: CGFloat = 4, scale: Bool = true) {
       layer.masksToBounds = false
       layer.shadowColor = color.cgColor
       layer.shadowOpacity = opacity
       layer.shadowOffset = CGSize(width: 4, height: 4)//offSet
       layer.shadowRadius = radius

//       layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
       layer.shouldRasterize = true
//       layer.rasterizationScale = scale ? UIScreen.main.scale : 1
     }
    
    
    
}

extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }
}

extension UIViewController {

@objc func dismissKeyboard() {

    view.endEditing(true)

    }

}

