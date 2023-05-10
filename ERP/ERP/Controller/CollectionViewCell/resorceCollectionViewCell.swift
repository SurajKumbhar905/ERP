//
//  resorceCollectionViewCell.swift
//  ERP
//
//  Created by Suraj on 23/04/23.
//

import UIKit

class resorceCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var resourceCardHeight: NSLayoutConstraint!
    @IBOutlet var ResourceCard: UIView!
    @IBOutlet var CrossButton: UIButton!
    
    @IBOutlet var resource_EmployeeLabel: UILabel!
    @IBOutlet var resource_EmployeeView: UIView!
    @IBOutlet var resource_EmployeeTable: UITableView!
    @IBOutlet var resource_EmployeeTable_height: NSLayoutConstraint!
    
    
    @IBOutlet var role_ExpertiesLabel: UILabel!
    
    @IBOutlet var role_ExpertiesView: UIView!
    @IBOutlet var role_ExpertiesTable: UITableView!
    
    @IBOutlet var role_ExpertiesTableHeight: NSLayoutConstraint!
    
    
    @IBOutlet var weeklyHoursLabel: UILabel!
    @IBOutlet var weeklyValueView: UIView!
    @IBOutlet var weeklyValueLabel: UILabel!
    @IBOutlet var weeklyHoursSlider: UISlider!
    
    
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var durationView: UIView!
    @IBOutlet var durationTable: UITableView!
    @IBOutlet var durationTableHeight: NSLayoutConstraint!
    
    @IBOutlet var setCostLabel: UILabel!
    @IBOutlet var setCostYTextFeild: UITextField!
    
    
}

extension resorceCollectionViewCell {
    
    func setupResourceCell(){
        
        resource_EmployeeTable.delegate = self
        resource_EmployeeTable.dataSource = self
        role_ExpertiesTable.delegate = self
        role_ExpertiesTable.dataSource = self
        durationTable.delegate = self
        durationTable.dataSource = self
        
        
        resource_EmployeeTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        resource_EmployeeTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        role_ExpertiesTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        role_ExpertiesTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        durationTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        durationTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        
        weeklyHoursSlider.value = 0 // Set initial value of slider
        weeklyHoursSlider.addTarget(self, action: #selector(weeklyHoursSliderDidChange(_:)), for: .valueChanged)
        
        
        let resource_EmployeeTap = UITapGestureRecognizer(target: self, action: #selector(self.resource_employeeTapHandle(_:)))
        resource_EmployeeView.addGestureRecognizer(resource_EmployeeTap)
        self.resource_EmployeeTable_height.constant = 0
        
        
        let role_ExpertiesTap = UITapGestureRecognizer(target: self, action: #selector(self.role_expertiesTapHandle(_:)))
        role_ExpertiesView.addGestureRecognizer(role_ExpertiesTap)
        self.role_ExpertiesTableHeight.constant = 0
        
        
        let durationTap = UITapGestureRecognizer(target: self, action: #selector(self.durationTapHandle(_:)))
        durationView.addGestureRecognizer(durationTap)
        self.durationTableHeight.constant = 0
        
    }
}


extension resorceCollectionViewCell{
    
    @objc func resource_employeeTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        
        UIView.animate(withDuration: 0.4, animations: {
            if self.resource_EmployeeTable_height.constant == 60
            {
                self.resource_EmployeeTable_height.constant = 0
//                self.resourceCardHeight.constant = 350
            }else
            {
                
                self.resource_EmployeeTable_height.constant = 60
                self.resourceCardHeight.constant = 1050
                self.role_ExpertiesTableHeight.constant = 0
                self.durationTableHeight.constant = 0
            }
            self.contentView.layoutIfNeeded()
        })
//        ProjectEditViewController.Instance?.resourceCollectionView.reloadData()
    }
    
    
    @objc func role_expertiesTapHandle(_ sender: UITapGestureRecognizer? = nil) {
       
        UIView.animate(withDuration: 0.4, animations: {
            if self.role_ExpertiesTableHeight.constant == 60
            {
                self.role_ExpertiesTableHeight.constant = 0
//                self.resourceCardHeight.constant = 350
            }else
            {
                self.role_ExpertiesTableHeight.constant = 60
                self.resourceCardHeight.constant = 450
                self.resource_EmployeeTable_height.constant = 0
                self.durationTableHeight.constant = 0
            }
            self.contentView.layoutIfNeeded()
            
        })
//        ProjectEditViewController.Instance?.resourceCollectionView.reloadData()
    }
    
    
    @objc func durationTapHandle(_ sender: UITapGestureRecognizer? = nil) {
//        ProjectEditViewController.Instance?.resourceCollectionView.reloadData()
        UIView.animate(withDuration: 0.4, animations: {
            if self.durationTableHeight.constant == 60
            {
                self.durationTableHeight.constant = 0
//                self.resourceCardHeight.constant = 350
            }else
            {
                self.durationTableHeight.constant = 60
                self.resourceCardHeight.constant = 450
                self.resource_EmployeeTable_height.constant = 0
                self.role_ExpertiesTableHeight.constant = 0
            }
            self.contentView.layoutIfNeeded()
        })
//        ProjectEditViewController.Instance?.resourceCollectionView.reloadData()
    }
    
    
    @objc func weeklyHoursSliderDidChange(_ sender: UISlider) {
        let value = sender.value
        print("Slider value changed to: \(value)")
        weeklyValueLabel.text = "\(Int(value * 48))"
    }
    
}



extension resorceCollectionViewCell : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        
        return cell
    }
    
    
}
extension resorceCollectionViewCell {
   
    func AddStyleCell()
    {
        
        ResourceCard.layer.cornerRadius = 8
        ResourceCard.backgroundColor = UIColor.ProjectEditCard.mileStoneCard
        
        
        resource_EmployeeView.layer.cornerRadius = 8
        resource_EmployeeLabel.text = "Resourse/Employee"
        
        
        role_ExpertiesView.layer.cornerRadius = 8
        role_ExpertiesLabel.text = "Role/Experties"
        
        weeklyValueView.layer.cornerRadius = 8
        weeklyHoursLabel.text = "Set Weekly Hours"
        
       
        weeklyHoursSlider.thumbTintColor = UIColor(hexString: "#8F8F8F")
        weeklyHoursSlider.tintColor = UIColor.black
        
        durationView.layer.cornerRadius = 8
        durationLabel.text = "Set Duration*"
        
        setCostLabel.text = "Set Cost*"
        setCostYTextFeild.layer.cornerRadius = 8
    }
    
}

