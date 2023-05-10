//
//  MilestoneCollectionViewCell.swift
//  ERP
//
//  Created by Suraj on 23/04/23.
//

import UIKit

class MilestoneCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var mileStoneCard: UIView!
    @IBOutlet var mileStoneMinusButton: UIButton!
    @IBOutlet var mileStoneLabel: UILabel!
    @IBOutlet var mileStoneTextFeild: UITextField!
    @IBOutlet var resourceLabel: UILabel!
    @IBOutlet var resourceTextFeild: UITextField!
    @IBOutlet var discriptionLabel: UILabel!
    @IBOutlet var discriptionTextFeild: UITextField!
    
    
    
    
    
}

extension MilestoneCollectionViewCell {
    
    func setupMileStoneCell(){
       
        mileStoneCard.layer.cornerRadius = 15
        mileStoneCard.backgroundColor = UIColor.ProjectEditCard.mileStoneCard
        mileStoneLabel.text = "MileStone*"
        mileStoneTextFeild.layer.cornerRadius = 15
        mileStoneTextFeild.layer.borderWidth = 0.1
        mileStoneTextFeild.clipsToBounds = true
        
        resourceTextFeild.layer.cornerRadius = 15
        resourceTextFeild.layer.borderWidth = 0.1
        resourceTextFeild.clipsToBounds = true
        resourceLabel.text = "Resource*"
        
        discriptionTextFeild.layer.cornerRadius = 15
        discriptionTextFeild.layer.borderWidth = 0.1
        discriptionTextFeild.clipsToBounds = true
        discriptionLabel.text = "Discription*"
        mileStoneMinusButton.layer.cornerRadius = 12.5
        mileStoneMinusButton.setImage(UIImage(named: "MinusButton"), for: .normal)
        mileStoneMinusButton.backgroundColor = UIColor.clear
        mileStoneCard.bringSubviewToFront(mileStoneMinusButton)
        
    }
}
