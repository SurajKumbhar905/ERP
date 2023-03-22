//
//  EmployeeViewController.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import UIKit

class EmployeeViewController: BaseViewController {
    
    
    @IBOutlet var employeeDetailView: UIView!
    @IBOutlet var employeeInformationCard: UIView!
    @IBOutlet var employeeName: UILabel!
    @IBOutlet var employeeDesignation: UILabel!
    
    @IBOutlet var employeeIdLabel: UILabel!
    @IBOutlet var employeeProjectCount: UILabel!
    
    
    @IBOutlet var employeeRoleLabel: UILabel!
    @IBOutlet var employeeSkillSet: UILabel!
    
    
    @IBOutlet var employeeEditButton: UIButton!
    
    
    let button = UIButton(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
//        setupNAvigationToMainScreen(titleText: self.title ?? "")
    }
    
    
    
    
    
    
}


extension EmployeeViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = collectionView.dequeueReusableCell(withReuseIdentifier: "EmployeeCell", for: indexPath) as! EmployeeCollectionViewCell
        
        card.addEmployeeAttribute()
//        card.employeeName.text = "Kamakshi Prabhuajgavkar"
//        card.employeeCard.backgroundColor = .red
//        card.employeeCard.layer.cornerRadius = 15
        return card
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        employeeDetailView.isHidden = false
    }
    
    
}



