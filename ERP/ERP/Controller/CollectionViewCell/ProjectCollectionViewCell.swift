//
//  ProjectCollectionViewCell.swift
//  ERP
//
//  Created by Suraj on 26/03/23.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var projectName: UILabel!
    @IBOutlet var projectBuName: UILabel!
    
    @IBOutlet var projectcard: UIView!
    
    
    
    
}

 
extension ProjectCollectionViewCell
{
    func addprojectAttribute()
    {
        projectcard.layer.cornerRadius = 15
        projectcard.backgroundColor = UIColor.employeeCard.mainCard

        
        projectBuName.textColor = UIColor.text.textColorLevel2
    }
}
