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
    
}

extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }
}


