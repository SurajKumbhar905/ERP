//
//  ColorExtention.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import Foundation
import UIKit


extension UIColor{
    
    
    
    convenience init(hexString: String)
    {
        var _hexString = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        
        if _hexString.hasPrefix("#")
        {
            _hexString = String(_hexString.dropFirst(1))
        }
        
        let scanner = Scanner(string: _hexString)
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
    
    struct Button {
        static let loginButton = UIColor(hexString: "#3B3B3B")
        static let loginWithEMS = UIColor(hexString: "#FFFFFF")
        
        
        
    }
    
    struct text {
        
        static let textColorLevel1 = UIColor(hexString: "#000000")
        static let textColorLevel2 = UIColor(hexString: "#4C4C4C")
        static let textColorLevel3 = UIColor(hexString: "#434343")
    }
    
    struct buttonText {
        static let buttonText1 = UIColor(hexString: "#DCDCDC")
        static let buttonText2 = UIColor(hexString: "#4C4C4C")
        
    }
    
    struct textFeildBackground {
        static let textFeild = UIColor(hexString: "#E4E4E4")
    }
    
    struct cardBackGroundClor {
        static let mainCard = UIColor(hexString: "#D9D9D9")
        static let addnew = UIColor(hexString: "#FAFAFA")
    }
}
