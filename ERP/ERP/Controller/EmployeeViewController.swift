//
//  EmployeeViewController.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import UIKit

class EmployeeViewController: BaseViewController {
    
    let button = UIButton(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Employee"
        
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        
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
    
    
}



