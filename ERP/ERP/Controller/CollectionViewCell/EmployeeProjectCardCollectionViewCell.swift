//
//  EmployeeProjectCardCollectionViewCell.swift
//  ERP
//
//  Created by Suraj on 22/03/23.
//

import UIKit

class EmployeeProjectCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var employeeProjectCard: UIView!
    @IBOutlet var employeProjectName: UILabel!
    @IBOutlet var employeeReleseDate: UILabel!
    @IBOutlet var employeeBilling: UILabel!
    @IBOutlet var employeeUtilization: UILabel!
    @IBOutlet var employeeStatus: UILabel!
    
}


extension EmployeeProjectCardCollectionViewCell{
    
    func addprojectAttribute(){
        employeeProjectCard.layer.cornerRadius = 15
        employeeProjectCard.backgroundColor = UIColor.employeeCard.mainCard
        employeProjectName.textColor = UIColor.text.textColorLevel2
        
        employeeReleseDate.textColor = UIColor.text.textColorLevel2
        
        employeeBilling.textColor = UIColor.text.textColorLevel2
        
        employeeUtilization.textColor = UIColor.text.textColorLevel2
        
        employeeStatus.textColor = UIColor.text.textColorLevel2
    }
    
    
//    func shadowDecorate(radius: CGFloat = 15,
//                        shadowColor: UIColor = UIColor.black,
//                           shadowOffset: CGSize = CGSize(width: 0, height: 3.0),
//                        shadowRadius: CGFloat = 3,
//                        shadowOpacity: Float = 0.3) {
//        employeeProjectCard.layer.cornerRadius = radius
//        employeeProjectCard.layer.borderWidth = 0.1
//        employeeProjectCard.layer.borderColor = UIColor.black.cgColor
//        employeeProjectCard.layer.masksToBounds = true
//
//           layer.shadowColor = shadowColor.cgColor
//           layer.shadowOffset = shadowOffset
//           layer.shadowRadius = shadowRadius
//           layer.shadowOpacity = shadowOpacity
//           layer.masksToBounds = false
//           layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
//           layer.cornerRadius = radius
//        layer.shouldRasterize = true
//        layer.rasterizationScale = UIScreen.main.scale
//       }
}
