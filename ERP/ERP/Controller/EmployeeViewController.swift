//
//  EmployeeViewController.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import UIKit

class EmployeeViewController: BaseViewController {
    
    var selectedIndexPath: IndexPath?
    
    static var Instance = EmployeeViewController()
    
    @IBOutlet var employeeDetailView: UIView!
    @IBOutlet var employeeInformationCard: UIView!
    @IBOutlet var employeeName: UILabel!
    @IBOutlet var employeeDesignation: UILabel!
    
    @IBOutlet var employeeIdLabel: UILabel!
    @IBOutlet var employeeProjectCount: UILabel!
    
    
    @IBOutlet var employeeRoleLabel: UILabel!
    @IBOutlet var employeeSkillSet: UILabel!
    
    
    @IBOutlet var employeeEditButton: UIButton!
    
    
    
    @IBOutlet var employeeprojectCollectionView: UICollectionView!
    
    
    let button = UIButton(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        EmployeeViewController.Instance = self
        title = "Employee"
        
        employeeInformationCard.setUpemployeeDetailCard()
        employeeEditButton.addButtonAttribute(buttonText: "Edit", conrnerRedius: 15, backGroundColor: UIColor.Button.loginButton, buttonTextColor: UIColor.buttonText.buttonText1, buttonTextFont: 13)
        
        employeeDesignation.textColor = UIColor.text.textColorLevel2
        
        employeeProjectCount.textColor = UIColor.text.textColorLevel2
        
        employeeSkillSet.textColor = UIColor.text.textColorLevel2
        
        employeeIdLabel.textColor = UIColor.text.textColorLevel2
        employeeRoleLabel.textColor = UIColor.text.textColorLevel2
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        employeeDetailView.isHidden = true
        setUpNavigation()
//
//        CGPoint newContentOffset = yourCollectionView.contentOffset;
//        float offset = selectedIndex * (self.view.bounds.size.width + cellSpacing);
//        newContentOffset.x += offset;
//        yourCollectionView.contentOffset = newContentOffset;
       
//        setupNAvigationToMainScreen(titleText: self.title ?? "")
    }
    
    
    
    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        var indexPath: NSIndexPath = NSIndexPath(item: 3, section: 0)
//        employeeprojectCollectionView.scroll
//        employeeprojectCollectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: true)
    }
    
    
}


extension EmployeeViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        
        if collectionView == self.employeeprojectCollectionView {
            
               return 2
            
           } else {
               return 100
           }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
       
        
        
        if collectionView == self.employeeprojectCollectionView
        {
            
            let card = collectionView.dequeueReusableCell(withReuseIdentifier: "EmployeeProjectCard", for: indexPath) as! EmployeeProjectCardCollectionViewCell
            card.addprojectAttribute()
            
            return card
            
            
        }
        else
        {
            let card = collectionView.dequeueReusableCell(withReuseIdentifier: "EmployeeCell", for: indexPath) as! EmployeeCollectionViewCell
            
            card.addEmployeeAttribute()
            return card
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        employeeprojectCollectionView.scrollToItem(at: [0,0], at: .right, animated: true)
        employeeDetailView.isHidden = false
        setUpNavigation()
//        selectedIndexPath = indexPath
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
           
//           let movedItem = myDataSource.remove(at: sourceIndexPath.item)
//           myDataSource.insert(movedItem, at: destinationIndexPath.item)
//
           collectionView.reloadData()
       }
    
    
    
    
    
}



