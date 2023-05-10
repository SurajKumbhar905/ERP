//
//  MileStoneNibCollectionViewCell.swift
//  ERP
//
//  Created by Suraj on 23/04/23.
//

import UIKit

class MileStoneNibCollectionViewCell: UICollectionViewCell {

    @IBOutlet var mileStoneCard: UIView!
    @IBOutlet var minusButton: UIButton!
    
    @IBOutlet var milestoneLabel: UILabel!
    @IBOutlet var mileStoneTextFeild: UITextField!
    
    
    @IBOutlet var resourceLabel: UILabel!
    @IBOutlet var resourceTextFeild: UITextField!
    
    
    @IBOutlet var mileStoneDiscriptionLabel: UILabel!
    @IBOutlet var mileStoneDescriptionTextFeild: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
