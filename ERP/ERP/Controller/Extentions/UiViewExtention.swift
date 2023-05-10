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
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, radius: CGFloat = 5, scale: Bool = true) {
       layer.masksToBounds = false
       layer.shadowColor = color.cgColor
       layer.shadowOpacity = opacity
       layer.shadowOffset = CGSize(width: 0, height: 4)//offSet
       layer.shadowRadius = radius

       layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
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

//@objc func dismissKeyboard() {
//
//    view.endEditing(true)
//
//    }

}

extension UIView {
    func addDashedBorder(color: CGColor) {
//    let color = UIColor.red.cgColor

    let shapeLayer:CAShapeLayer = CAShapeLayer()
    let frameSize = self.frame.size
        let lineWidth: CGFloat = 2.0
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width - lineWidth, height: frameSize.height - lineWidth)
//    let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

    shapeLayer.bounds = shapeRect
    shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = color
    shapeLayer.lineWidth = 2
    shapeLayer.lineJoin = CAShapeLayerLineJoin.round
    shapeLayer.lineDashPattern = [6,3]
    shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath

    self.layer.addSublayer(shapeLayer)
    }
}
