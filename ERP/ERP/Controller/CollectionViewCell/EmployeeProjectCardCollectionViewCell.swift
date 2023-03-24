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
}
