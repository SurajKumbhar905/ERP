//
//  ProjectEditViewController.swift
//  ERP
//
//  Created by Suraj on 21/04/23.
//

import UIKit

class ProjectEditViewController: UIViewController {
    
    static var Instance : ProjectEditViewController?
    
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
    
    
    @IBOutlet var mileStoneSubStackView: UIStackView!
    @IBOutlet var mileStoneStackView: UIStackView!
    @IBOutlet var totalCurrancy_CostLabel: UILabel!
    @IBOutlet var totalCurrencyCostTextFeild: UITextField!
    @IBOutlet var mileStoneCollectionView: UICollectionView!
    @IBOutlet var addNewMileStoneView: UIView!
    @IBOutlet var addNewMileStoneImage: UIImageView!
    
    @IBOutlet var mileStoneCollectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet var resourceCollectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet var resourceStackView: UIStackView!
    @IBOutlet var resourceCollectionView: UICollectionView!
    @IBOutlet var resourceAddNewView: UIView!
    @IBOutlet var resourceImage: UIImageView!
    
    var collectionViewWidth: CGFloat = 0
    
    @IBOutlet var uploadSowButton: UIButton!
    @IBOutlet var uploadSowLabel: UILabel!
    
    var data = [MilestoneCollectionViewCell]()
    var resourceData = [resorceCollectionViewCell]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProjectEditViewController.Instance = self
        mileStoneCollectionView.delegate = self
        mileStoneCollectionView.dataSource = self
        resourceCollectionView.dataSource = self
        resourceCollectionView.delegate = self
        setupProjectFilter()
        
//        collectionViewWidth = mileStoneCollectionView.frame.width
//        mileStoneCollectionView.collectionViewLayout.invalidateLayout()
        
        let flowLayout = UICollectionViewFlowLayout()

        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize

        resourceCollectionView?.collectionViewLayout = flowLayout
        
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
    
    
    @IBAction func mileStoneButtonClick(_ sender: Any)
    {
        
        
        mileStoneSubStackView.isHidden = false
        UIView.animate(withDuration: 0.4,  animations: { [self] in
            
            mileStoneButton.setImage(UIImage(named: "SelectRadioButton"), for: .normal)
            ResourceButton.setImage(UIImage(named: "UnselectRadioButton"), for: .normal)
            mileStoneButton.alpha = 1.0
            milestoneLabel.alpha = 1.0
            ResourceButton.alpha = 0.5
            resourceLabel.alpha = 0.5
            
            self.view.layoutIfNeeded()
        })
        
        
        
    }
    
    
    @IBAction func resourceButtonClick(_ sender: Any)
    {
        mileStoneSubStackView.isHidden = true
        
        UIView.animate(withDuration: 0.4, animations: { [self] in
            
            ResourceButton.setImage(UIImage(named: "SelectRadioButton"), for: .normal)
            mileStoneButton.setImage(UIImage(named: "UnselectRadioButton"), for: .normal)
            ResourceButton.alpha = 1.0
            resourceLabel.alpha = 1.0
            mileStoneButton.alpha = 0.5
            milestoneLabel.alpha = 0.5
            
            
            self.view.layoutIfNeeded()
        })
    }
    
}


extension ProjectEditViewController {
    
    func setupProjectFilter()
    {
        let blurTap = UITapGestureRecognizer(target: self, action: #selector(self.blurViewTapHandle(_:)))
        BlurView.addGestureRecognizer(blurTap)
        
        
        let businessUnitTap = UITapGestureRecognizer(target: self, action: #selector(self.businessUnitTap(_:)))
        businessUnitView.addGestureRecognizer(businessUnitTap)
        businessUnitTableHeight.constant = 0
        
        
        let CurrencyTap = UITapGestureRecognizer(target: self, action: #selector(self.currencyTapHandle(_:)))
        currencyView.addGestureRecognizer(CurrencyTap)
        currencyTableViewHeight.constant = 0
        
        let AddNew = UITapGestureRecognizer(target: self, action: #selector(self.addNewTapHandle(_:)))
        addNewMileStoneView.addGestureRecognizer(AddNew)
        
        let addNewResource = UITapGestureRecognizer(target: self, action: #selector(self.addNewResourceTapHandle(_:)))
        resourceAddNewView.addGestureRecognizer(addNewResource)
        
        
        businessUnitTableView.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        businessUnitTableView.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        
        currencyTableView.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        currencyTableView.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        
        
        
        //        let nib = UINib(nibName: "MileStoneNibCollectionViewCell", bundle: nil)
        //        mileStoneCollectionView.register(nib, forCellWithReuseIdentifier: "MileStoneNibCollectionViewCell")
        mileStoneCollectionViewHeight.constant = 245
        mileStoneCollectionView.backgroundColor = UIColor.clear
        
        resourceCollectionViewHeight.constant = 395
        resourceCollectionView.backgroundColor = UIColor.clear
        
        data.append(MilestoneCollectionViewCell())
        resourceData.append(resorceCollectionViewCell())
        ResourceButton.alpha = 0.5
        resourceLabel.alpha = 0.5
        
        addNewMileStoneImage.image = UIImage(named: "AddIcon")
        addNewMileStoneView.layer.borderWidth = 0.3
        addNewMileStoneView.layer.cornerRadius = 15
        
        
        resourceImage.image = UIImage(named: "AddIcon")
        resourceAddNewView.layer.borderWidth = 0.3
        resourceAddNewView.layer.cornerRadius = 15
        
        
    }
}


extension ProjectEditViewController {
    
    @objc func blurViewTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        BlurView.isHidden = true
        if let parentVC = parent as? ProjectViewController {
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
                self.currencyTableViewHeight.constant = 0
                
            }
            self.view.layoutIfNeeded()
        })
    }
    
    
    @objc func currencyTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        UIView.animate(withDuration: 0.4, animations: {
            if self.currencyTableViewHeight.constant == 120
            {
                self.currencyTableViewHeight.constant = 0
                
            }else
            {
                self.currencyTableViewHeight.constant = 120
                self.businessUnitTableHeight.constant = 0
                
            }
            self.view.layoutIfNeeded()
        })
    }
    
    
    @objc func addNewTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        
        data.append(MilestoneCollectionViewCell())
        
        UIView.animate(withDuration: 0.4, animations: { [self] in
            let newIndexPath = IndexPath(row: data.count - 1, section: 0)
            mileStoneCollectionView.insertItems(at: [newIndexPath])
            
            mileStoneCollectionViewHeight.constant = CGFloat(data.count * 245)
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func addNewResourceTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        
        resourceData.append(resorceCollectionViewCell())
        
        UIView.animate(withDuration: 0.4, animations: { [self] in
            let newIndexPath = IndexPath(row: resourceData.count - 1, section: 0)
            resourceCollectionView.insertItems(at: [newIndexPath])
            
            resourceCollectionViewHeight.constant = CGFloat(resourceData.count * 395)
            self.view.layoutIfNeeded()
        })
        
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        

        if data.count > 1{
            
            
            if data.indices.contains(sender.tag)
            {
                // Remove item from data array
                print("Index out of range REMOVE",sender.tag)
                
                data.remove(at: sender.tag)
                
                UIView.animate(withDuration: 0.4, animations: { [self] in
                    
                    
                    let indexPath = IndexPath(row: sender.tag, section: 0)
                    self.mileStoneCollectionView.deleteItems(at: [indexPath])
                    
                    let height = mileStoneCollectionView.frame.height
                    
                    mileStoneCollectionViewHeight.constant = height - 245
                    self.view.layoutIfNeeded()
                },completion: { _ in
                    self.mileStoneCollectionView.reloadData()
                })
//                self.mileStoneCollectionView.reloadData()
                
//                checkCell()
                
            }
            else
            {
                
                print("Index out of range",sender.tag)
            }
            
        }
        
        
        
    }
    
    
    
    @objc func resourcedeleteButtonTapped(_ sender: UIButton){
        
        if resourceData.count > 1{
            
            
            if resourceData.indices.contains(sender.tag)
            {
                // Remove item from data array
                print("Index out of range REMOVE",sender.tag)
                
                resourceData.remove(at: sender.tag)
                
                UIView.animate(withDuration: 0.4, animations: { [self] in
                    
                    
                    let indexPath = IndexPath(row: sender.tag, section: 0)
                    self.resourceCollectionView.deleteItems(at: [indexPath])
                    
                    let height = resourceCollectionView.frame.height
                    
                    resourceCollectionViewHeight.constant = height - 395
                    self.view.layoutIfNeeded()
                },completion: { _ in
                    self.resourceCollectionView.reloadData()
                })
//                self.mileStoneCollectionView.reloadData()
                
//                checkCell()
                
            }
            else
            {
                
                print("Index out of range",sender.tag)
            }
            
        }
        
        
    }
    
}


extension ProjectEditViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == businessUnitTableView
        {
            return DummyData.Instance.busenessUnitCount()
        }else
        {
            return DummyData.Instance.currencyCount()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        
        if tableView == businessUnitTableView
        {
            cell.cellLabel.text = DummyData.Instance.busenessUnit[indexPath.row]
        }
        else
        {
            cell .cellLabel.text = DummyData.Instance.currency[indexPath.row]
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == businessUnitTableView
        {
            UIView.animate(withDuration: 0.4, animations: {
                self.businesessUnitLabel.text = DummyData.Instance.busenessUnit[indexPath.row]
                self.businessUnitTableHeight.constant = 0
                self.view.layoutIfNeeded()
            })
        }
        else
        {
            UIView.animate(withDuration: 0.4, animations: {
                self.currencyLabel.text = DummyData.Instance.currency[indexPath.row]
                self.currencyTableViewHeight.constant = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
}



extension ProjectEditViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == mileStoneCollectionView{
            return data.count
        }
        else {
            return resourceData.count
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == resourceCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resorceCollectionViewCell", for: indexPath) as! resorceCollectionViewCell
            
            cell.CrossButton.tag = indexPath.row
            cell.CrossButton.isHidden = false
            cell.CrossButton.addTarget(self, action: #selector(resourcedeleteButtonTapped(_:)), for: .touchUpInside)
            cell.resourceCardHeight.constant = 375
            cell.weeklyValueLabel.text = "0"
            cell.setupResourceCell()
            cell.AddStyleCell()
            checkCell(collectionView: collectionView)
            return cell
            
        }else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MilestoneCollectionViewCell", for: indexPath) as! MilestoneCollectionViewCell
            
            cell.mileStoneMinusButton.tag = indexPath.row
            cell.mileStoneMinusButton.isHidden = false
            cell.mileStoneMinusButton.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
            cell.setupMileStoneCell()
            checkCell(collectionView: collectionView)
            return cell
            
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        resourceCollectionView.reloadData()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width
        if collectionView == mileStoneCollectionView{


            let height: CGFloat = 250 // set the height of your cell
            return CGSize(width: width, height: height)
        }else if collectionView == resourceCollectionView {

            return CGSize(width: width, height: 350)
        }
        else {
            return CGSize(width: width, height: 0)
        }


    }
    
    
   
    
}

extension  ProjectEditViewController{
    
    func checkCell(collectionView : UICollectionView)
    {
        if collectionView == mileStoneCollectionView{
            for cell in mileStoneCollectionView.visibleCells {
                
                if let myCell = cell as? MilestoneCollectionViewCell {
                    myCell.mileStoneMinusButton.isHidden = true
                }
            }
        }
        else {
            for cell in resourceCollectionView.visibleCells {
                
                if let myCell = cell as? resorceCollectionViewCell {
                    myCell.CrossButton.isHidden = true
                }
            }
            
        }
        
        
        
        
    }
    
}
