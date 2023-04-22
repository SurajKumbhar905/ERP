//
//  ProjectEditViewController.swift
//  ERP
//
//  Created by Suraj on 21/04/23.
//

import UIKit

class ProjectEditViewController: UIViewController {
    
    @IBOutlet var BlurView: UIView!
    
    @IBOutlet var projectEditView: UIView!
    @IBOutlet var projectEditBodyView: UIView!
    
    @IBOutlet var currencyTextFeild: UITextField!
    
    @IBOutlet var businessUnitView: UIView!
    @IBOutlet var businesessUnitLabel: UILabel!
    @IBOutlet var businessUnitTableView: UITableView!
    @IBOutlet var businessUnitTableHeight: NSLayoutConstraint!
    
    
    @IBOutlet var currencyView: UIView!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var currencyTableView: UITableView!
    @IBOutlet var currencyTableViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet var mileStoneButton: UIButton!
    @IBOutlet var milestoneLabel: UILabel!
    
    
    @IBOutlet var ResourceButton: UIButton!
    @IBOutlet var resourceLabel: UILabel!
    
    
    @IBOutlet var mileStoneStackView: UIStackView!
    @IBOutlet var totalCurrancy_CostLabel: UILabel!
    @IBOutlet var totalCurrencyCostTextFeild: UITextField!
    @IBOutlet var mileStoneCollectionView: UICollectionView!
    @IBOutlet var addNewMileStoneView: UIView!
    @IBOutlet var addNewMileStoneImage: UIImageView!
    
    
    
    @IBOutlet var resourceStackView: UIStackView!
    @IBOutlet var resourceCollectionView: UICollectionView!
    @IBOutlet var resourceAddNewView: UIView!
    
    
    
    @IBOutlet var uploadSowButton: UIButton!
    @IBOutlet var uploadSowLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupProjectFilter()
        
    }
    

    
   
    
}

extension ProjectEditViewController {
    
    @IBAction func crossButtonClick(_ sender: Any) {
        BlurView.isHidden = true
        if let parentVC = parent as? ProjectViewController {
            parentVC.dismissChildViewController()
        }
        
    }
    
    @IBAction func saveButtonClick(_ sender: Any) {
        
        BlurView.isHidden = true
        if let parentVC = parent as? ProjectViewController {
            parentVC.dismissChildViewController()
        }
    }
    
}


extension ProjectEditViewController {
    
    func setupProjectFilter()
    {
        let blurTap = UITapGestureRecognizer(target: self, action: #selector(self.blurViewTapHandle(_:)))
        BlurView.addGestureRecognizer(blurTap)
        
    }
}


extension ProjectEditViewController {
    
    @objc func blurViewTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        BlurView.isHidden = true
        if let parentVC = parent as? ProjectViewController {
            parentVC.dismissChildViewController()
        }
    }
}
