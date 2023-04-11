//
//  SowTableViewCell.swift
//  ERP
//
//  Created by Suraj on 06/04/23.
//

import UIKit

class SowTableViewCell: UITableViewCell {

    @IBOutlet var SowView: UIView!
    
    @IBOutlet var SowName: UILabel!
    
    @IBOutlet var sowDownLoadButton: UIButton!
    
    @IBOutlet var sowLastUpdateDate: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
