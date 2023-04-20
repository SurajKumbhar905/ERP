//
//  EmployeeCollectionViewCell.swift
//  ERP
//
//  Created by Suraj on 20/03/23.
//

import UIKit

class EmployeeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var employeeCard: UIView!
    @IBOutlet var employeeProfileImage: UIImageView!
    @IBOutlet var employeeName: UILabel!
    @IBOutlet var employeeProjectName: UILabel!
    
    
}


extension EmployeeCollectionViewCell{
    
    func addEmployeeAttribute(){
        let card = self
        
        card.employeeName.text = "Suraj Kumbhar"
        card.employeeName.textColor = UIColor.text.textColorLevel1
        card.employeeProjectName.textColor = UIColor.text.textColorLevel3
        card.employeeCard.layer.cornerRadius = 15
        
        card.employeeCard.backgroundColor = UIColor.employeeCard.mainCard
    }
    
//    func shadowDecorate(radius: CGFloat = 15,
//                        shadowColor: UIColor = UIColor.black,
//                           shadowOffset: CGSize = CGSize(width: 0, height: 3.0),
//                        shadowRadius: CGFloat = 3,
//                        shadowOpacity: Float = 0.3) {
//        contentView.layer.cornerRadius = radius
//        contentView.layer.borderWidth = 0.1
//        contentView.layer.borderColor = UIColor.black.cgColor
//        contentView.layer.masksToBounds = true
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
