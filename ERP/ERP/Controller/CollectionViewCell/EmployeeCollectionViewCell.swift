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
}
