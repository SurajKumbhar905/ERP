//
//  EmployeeFilterViewController.swift
//  ERP
//
//  Created by Suraj on 21/03/23.
//

import UIKit

class EmployeeFilterViewController: UIViewController {

    @IBOutlet var testView: UIView!
    
    @IBOutlet var businessHeadView: UIView!
    @IBOutlet var businessHeadLabel: UILabel!
    @IBOutlet var businessHeadTable: UITableView!
    @IBOutlet var businessHeadTableHeight: NSLayoutConstraint!
    @IBOutlet var businessHeadFilterImage: UIImageView!
    
    
    @IBOutlet var businessUnitView: UIView!
    @IBOutlet var businessUnitLabel: UILabel!
    @IBOutlet var businessUnitTable: UITableView!
    @IBOutlet var businessUnitTableHeight: NSLayoutConstraint!
    @IBOutlet var businessUnitImage: UIImageView!
    
    
    @IBOutlet var statusView: UIView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var statusTable: UITableView!
    @IBOutlet var statusTableHeight: NSLayoutConstraint!
    @IBOutlet var statusImage: UIImageView!
    
    
    @IBOutlet var filterCardView: UIView!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var restButton: UIButton!
    
    
    @IBOutlet var Apply_Botton: UIButton!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testView.backgroundColor = .white
        
        testView.layer.cornerRadius = 10
        testView.clipsToBounds = true
        
        
        businessHeadTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        businessHeadTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
       

        businessUnitTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        businessUnitTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        statusTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        statusTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        
        
        let businessHeadTap = UITapGestureRecognizer(target: self, action: #selector(self.businessHeadTapHandel(_:)))
        businessHeadView.addGestureRecognizer(businessHeadTap)
        self.businessHeadTableHeight.constant = 0
        
        
        let businessUnitTap = UITapGestureRecognizer(target: self, action: #selector(self.businessUnitTapHandel(_:)))
        businessUnitView.addGestureRecognizer(businessUnitTap)
        self.businessUnitTableHeight.constant = 0
        
        
        let statusTap = UITapGestureRecognizer(target: self, action: #selector(self.statusTapHandel(_:)))
        statusView.addGestureRecognizer(statusTap)
        self.statusTableHeight.constant = 0
        
        
        setupFilterView()
        
    }
    

    func setupFilterView()
    {
        
//        filterCardView.backgroundColor = UIColor.cardBackGroundClor.filterCard
        
        restButton.tintColor = UIColor.black
        Apply_Botton.backgroundColor = UIColor.Button.filterButton
        Apply_Botton.tintColor = UIColor.buttonText.buttonText1
       
        businessHeadLabel.text = constentData.businessHeadName
        businessHeadView.layer.cornerRadius = 5
        businessHeadView.backgroundColor = UIColor.cardBackGroundClor.mainCard
        businessHeadTable.backgroundColor = UIColor.cardBackGroundClor.addnew
        
        businessUnitLabel.text = constentData.businessUnitName
        businessUnitView.layer.cornerRadius = 5
        businessUnitView.backgroundColor = UIColor.cardBackGroundClor.mainCard
        businessUnitTable.backgroundColor = UIColor.cardBackGroundClor.addnew
        
        
        statusLabel.text = constentData.status
        statusView.layer.cornerRadius = 5
        statusView.backgroundColor = UIColor.cardBackGroundClor.mainCard
        statusTable.backgroundColor = UIColor.cardBackGroundClor.addnew
        
    }
    
    
    @IBAction func clickOnApplyButtob(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func resetButtonClick(_ sender: Any) {
        
       
        constentData.businessHeadName = "Select Head"
        constentData.businessUnitName = "Select Unit"
        constentData.status = "Select Status"
        
        businessHeadLabel.text = constentData.businessHeadName
        businessUnitLabel.text =  constentData.businessUnitName
        statusLabel.text = constentData.status
        
        
    }
    
    @IBAction func clickOnCrossButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        guard let touchLocation = touches.first?.location(in: self.view) else { return }
        
        if self.testView.frame.contains(touchLocation) {
            return
        }else{
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    @objc func businessHeadTapHandel(_ sender: UITapGestureRecognizer? = nil) {
        

        UIView.animate(withDuration: 0.4, animations: {
            if self.businessHeadTableHeight.constant == 120
            {
                self.businessHeadTableHeight.constant = 0
                 //self.businessHeadFilterImage.transform.rotated(by: CGFloat(Double.pi))
            }else
            {
                self.businessHeadTableHeight.constant = 120
                self.businessUnitTableHeight.constant = 0
                self.statusTableHeight.constant = 0
//                self.businessHeadFilterImage.transform = CGAffineTransform(rotationAngle: -CGFloat.pi) //self.businessHeadFilterImage.transform.rotated(by: CGFloat(Double.pi))
            }

            self.view.layoutIfNeeded()

            })
        
    }
    
    
    @objc func businessUnitTapHandel(_ sender: UITapGestureRecognizer? = nil) {
        

        UIView.animate(withDuration: 0.4, animations: {
            if self.businessUnitTableHeight.constant == 120
            {
                self.businessUnitTableHeight.constant = 0
            }else
            {
                self.businessUnitTableHeight.constant = 120
                self.businessHeadTableHeight.constant = 0
                self.statusTableHeight.constant = 0
            }

            self.view.layoutIfNeeded()

            })
        
    }
    
    
    @objc func statusTapHandel(_ sender: UITapGestureRecognizer? = nil) {
        

        UIView.animate(withDuration: 0.4, animations: {
            if self.statusTableHeight.constant == 120
            {
                self.statusTableHeight.constant = 0
            }else
            {
                self.statusTableHeight.constant = 120
                self.businessUnitTableHeight.constant = 0
                self.businessHeadTableHeight.constant = 0
            }

            self.view.layoutIfNeeded()

            })
        
    }
    
    
    

}



extension EmployeeFilterViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if tableView == businessHeadTable{
            return DummyData.Instance.businessHeadCount()
        }else if tableView == businessUnitTable {
            return DummyData.Instance.busenessUnitCount()
        }else if tableView == statusTable{
            return DummyData.Instance.statusCount()
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        
        
        if tableView == businessHeadTable{
            cell.cellLabel.text = DummyData.Instance.businessHead[indexPath.row]
            return cell
        }
        else if tableView == businessUnitTable {
            cell.cellLabel.text = DummyData.Instance.busenessUnit[indexPath.row]
            return cell
        }
        else
        {
            cell.cellLabel.text = DummyData.Instance.status[indexPath.row]
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == businessHeadTable{
           
            UIView.animate(withDuration: 0.4, animations: {
                constentData.businessHeadName = DummyData.Instance.businessHead[indexPath.row]
                self.businessHeadLabel.text = constentData.businessHeadName
                self.businessHeadTableHeight.constant = 0
                self.view.layoutIfNeeded()
            })
           
        }
        else if tableView == businessUnitTable {
            
            
            UIView.animate(withDuration: 0.4, animations: {
                constentData.businessUnitName = DummyData.Instance.busenessUnit[indexPath.row]
                self.businessUnitLabel.text = constentData.businessUnitName
                self.businessUnitTableHeight.constant = 0
                self.view.layoutIfNeeded()
            })
            
            
        }
        else
        {
            
            
            UIView.animate(withDuration: 0.4, animations: {
                constentData.status = DummyData.Instance.status[indexPath.row]
                self.statusLabel.text = constentData.status
                self.statusTableHeight.constant = 0
                self.view.layoutIfNeeded()
            })
            
        }
        
    }
    
    
}
