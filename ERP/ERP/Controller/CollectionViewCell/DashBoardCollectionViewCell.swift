//
//  DashBoardCollectionViewCell.swift
//  ERP
//
//  Created by Suraj on 19/03/23.
//

import UIKit

class DashBoardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var newAddCount: UIView!
    
    @IBOutlet var mainCountLabel: UILabel!
    
    @IBOutlet var cardNameLabel: UILabel!
    @IBOutlet var newAddCountLabel: UILabel!
    
    
    
    
}

extension DashBoardCollectionViewCell{
    
    func addAttibute(indexPath : IndexPath ){
        let card = self
        
        card.backgroundColor = .clear
        card.newAddCount.layer.cornerRadius = 10
        card.newAddCount.backgroundColor = .white
        card.newAddCountLabel.text = DummyData.Instance.newAddValue[indexPath.row]
        card.newAddCountLabel.textColor = UIColor.text.textColorLevel3
        card.cardNameLabel.text = DummyData.Instance.cardMainTitle[indexPath.row]
        card.cardNameLabel.textColor = UIColor.text.textColorLevel3
        card.mainCountLabel.text = DummyData.Instance.cardValue[indexPath.row]
        card.cardView.backgroundColor = UIColor.cardBackGroundClor.mainCard
        card.newAddCount.backgroundColor = UIColor.cardBackGroundClor.addnew
        card.cardView.layer.cornerRadius = 15
        card.cardView.clipsToBounds = true
        
       
    }
}
