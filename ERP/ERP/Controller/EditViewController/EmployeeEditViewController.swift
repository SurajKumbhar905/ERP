//
//  EmployeeEditViewController.swift
//  ERP
//
//  Created by Suraj on 11/04/23.
//

import UIKit

class EmployeeEditViewController: BaseViewController {
    
    @IBOutlet var BlurView: UIView!
    
    @IBOutlet var editView: UIView!
    
    @IBOutlet var hederViewOfEdit: UIView!
    
    @IBOutlet var BusinessUnitView: UIView!
    @IBOutlet var businessUnitLabel: UILabel!
    @IBOutlet var businessUnitTable: UITableView!
    @IBOutlet var businessUnitTableHeight: NSLayoutConstraint!
    
    
    
    @IBOutlet var statusView: UIView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var statusTable: UITableView!
    @IBOutlet var statusTableHeight: NSLayoutConstraint!
    
    
    @IBOutlet var projectTextFeild: UITextField!
    
    
    @IBOutlet var expertiesView: UIView!
    @IBOutlet var expertiesLabel: UILabel!
    @IBOutlet var expertiesTable: UITableView!
    @IBOutlet var expertiesTableHeight: NSLayoutConstraint!
    
    
    
    @IBOutlet var utilizationView: UIView!
    @IBOutlet var utilizationLabel: UILabel!
    @IBOutlet var utilazationTable: UITableView!
    @IBOutlet var utilizationTableHeight: NSLayoutConstraint!
    
    
    
    
    @IBOutlet var billingView: UIView!
    @IBOutlet var billinglabel: UILabel!
    @IBOutlet var billingTable: UITableView!
    @IBOutlet var billingTableHeight: NSLayoutConstraint!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        BlurView.isHidden = true
        editView.backgroundColor = .white
        editView.clipsToBounds = true
        editView.layer.cornerRadius = 15
        
        
        businessUnitTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        businessUnitTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        
        
        statusTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        statusTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        
        expertiesTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        expertiesTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        utilazationTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        utilazationTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        
        billingTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        billingTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        
        let blurTap = UITapGestureRecognizer(target: self, action: #selector(self.blurViewTapHandle(_:)))
        BlurView.addGestureRecognizer(blurTap)
        
        
        let businessUnitTap = UITapGestureRecognizer(target: self, action: #selector(self.businessUnitTap(_:)))
        BusinessUnitView.addGestureRecognizer(businessUnitTap)
        businessUnitTableHeight.constant = 0
        
        
        let statusTap = UITapGestureRecognizer(target: self, action: #selector(self.statusTapHandle(_:)))
        statusView.addGestureRecognizer(statusTap)
        statusTableHeight.constant = 0
        
        
        let expertiesTap = UITapGestureRecognizer(target: self, action: #selector(self.expertiesTapHandle(_:)))
        expertiesView.addGestureRecognizer(expertiesTap)
        expertiesTableHeight.constant = 0
        
        
        let utilizationTap = UITapGestureRecognizer(target: self, action: #selector(self.utilizationTapHandle(_:)))
        utilizationView.addGestureRecognizer(utilizationTap)
        utilizationTableHeight.constant = 0
        
        
        let billingTap = UITapGestureRecognizer(target: self, action: #selector(self.billingTapHandle(_:)))
        billingView.addGestureRecognizer(billingTap)
        billingTableHeight.constant = 0
        
        
    }
    
    
    
    @objc func blurViewTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        BlurView.isHidden = true
        if let parentVC = parent as? EmployeeViewController {
            parentVC.dismissChildViewController()
        }
    }
    
    
    @objc func businessUnitTap(_ sender: UITapGestureRecognizer? = nil) {
        UIView.animate(withDuration: 0.4, animations: {
            if self.businessUnitTableHeight.constant == 120
            {
                self.businessUnitTableHeight.constant = 0
                 
            }else
            {
                self.businessUnitTableHeight.constant = 120
                self.statusTableHeight.constant = 0
                self.expertiesTableHeight.constant = 0
                self.utilizationTableHeight.constant = 0
                self.billingTableHeight.constant = 0
            }
            self.view.layoutIfNeeded()
            })
    }
    
    
    @objc func statusTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        UIView.animate(withDuration: 0.4, animations: {
            if self.statusTableHeight.constant == 120
            {
                self.statusTableHeight.constant = 0
                 
            }else
            {
                self.statusTableHeight.constant = 120
                self.businessUnitTableHeight.constant = 0
                self.expertiesTableHeight.constant = 0
                self.utilizationTableHeight.constant = 0
                self.billingTableHeight.constant = 0
            }
            self.view.layoutIfNeeded()
            })
    }
    
    
    @objc func expertiesTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        UIView.animate(withDuration: 0.4, animations: {
            if self.expertiesTableHeight.constant == 120
            {
                self.expertiesTableHeight.constant = 0
                 
            }else
            {
                self.expertiesTableHeight.constant = 120
                self.businessUnitTableHeight.constant = 0
                self.statusTableHeight.constant = 0
                self.utilizationTableHeight.constant = 0
                self.billingTableHeight.constant = 0
            }
            self.view.layoutIfNeeded()
            })
    }
    
    
    @objc func utilizationTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        UIView.animate(withDuration: 0.4, animations: {
            if self.utilizationTableHeight.constant == 120
            {
                self.utilizationTableHeight.constant = 0
                 
            }else
            {
                self.utilizationTableHeight.constant = 120
                self.businessUnitTableHeight.constant = 0
                self.statusTableHeight.constant = 0
                self.expertiesTableHeight.constant = 0
                self.billingTableHeight.constant = 0
            }
            self.view.layoutIfNeeded()
            })
    }
    
    
    @objc func billingTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        UIView.animate(withDuration: 0.4, animations: {
            if self.billingTableHeight.constant == 120
            {
                self.billingTableHeight.constant = 0
                 
            }else
            {
                self.billingTableHeight.constant = 120
                self.utilizationTableHeight.constant = 0
                self.statusTableHeight.constant = 0
                self.expertiesTableHeight.constant = 0
                self.businessUnitTableHeight.constant = 0
            }
            self.view.layoutIfNeeded()
            })
    }
    
    
}



extension EmployeeEditViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == businessUnitTable {
            return DummyData.Instance.busenessUnitCount()
        }
        else if tableView == statusTable{
            return DummyData.Instance.statusCount()
        }else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        
        
        if tableView == businessUnitTable{
            cell.cellLabel.text = DummyData.Instance.busenessUnit[indexPath.row]
        }
        else if tableView == statusTable{
            cell.cellLabel.text = DummyData.Instance.status[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == businessUnitTable {
            UIView.animate(withDuration: 0.4, animations: {
                self.businessUnitLabel.text = DummyData.Instance.busenessUnit[indexPath.row]
                self.businessUnitTableHeight.constant = 0
                self.view.layoutIfNeeded()
            })
        }else if tableView == statusTable {
            UIView.animate(withDuration: 0.4, animations: {
                self.statusLabel.text = DummyData.Instance.status[indexPath.row]
                self.statusTableHeight.constant = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
}
