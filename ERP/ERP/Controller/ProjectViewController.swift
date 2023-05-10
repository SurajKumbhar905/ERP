//
//  ProjectViewController.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import UIKit

class ProjectViewController: BaseViewController {
    
    
    static var Instance = ProjectViewController()
    
    
    @IBOutlet var projectDetailCard: UIView!
    
    @IBOutlet var projectFilterButton: UIButton!
    
    
    @IBOutlet var projectDetailHeight: NSLayoutConstraint!
    
    @IBOutlet var MoreLessButton: UIButton!
    
    @IBOutlet var deveLoperStack: UIStackView!
    
    @IBOutlet var seniourDevloperStack: UIStackView!
    
    @IBOutlet var QaLeadStack: UIStackView!
    
    @IBOutlet var sQAStack: UIStackView!
    
    @IBOutlet var qaManualStack: UIStackView!
    
    @IBOutlet var SowtableView: UITableView!
    
    @IBOutlet var clientCard: UIView!
    
    @IBOutlet var sowCard: UIView!
    
    @IBOutlet var ProjectCollectionView: UICollectionView!
    
    
    @IBOutlet var projectDetailView: UIScrollView!
    @IBOutlet var projectEditButton: UIButton!
    
    @IBOutlet var noDataLabel: UILabel!
    @IBOutlet var searchBar: UISearchBar!
    
    var childVC =  UIViewController() //ProjectFilterViewController()
    //    var childVC2 = ProjectEditViewController()
    
    var filteredData = [String]()
    var click = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addShadow(view: projectDetailCard)
        addShadow(view: clientCard)
        addShadow(view: sowCard)
        ProjectViewController.Instance = self
        searchBar.delegate = self
        filteredData = DummyData.Instance.projectName
        noDataLabel.isHidden = true
        
        //        deveLoperStack.isHidden = true
        seniourDevloperStack.isHidden = true
        QaLeadStack.isHidden = true
        sQAStack.isHidden = true
        qaManualStack.isHidden = true
        
        //        self.projectDetailCard.frame = CGRect(x: 0, y: 0, width: self.projectDetailCard.frame.width, height: self.projectDetailCard.frame.height - 170.0)
        projectDetailHeight.constant = 300
        
        title = "Project"
        
        setupProject()
        
        
        view.bringSubviewToFront(projectDetailView)
        
        // Do any additional setup after loading the view.
        hideKeyboardWhenTappedAround()
    }
    
    
    func hideKeyboardWhenTappedAround()

    {
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        tapGestureRecognizer.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func dismissKeyboard()

       {

           view.endEditing(true)

       }
    
    
    @IBAction func projectFilterButtonClick(_ sender: Any)
    {
        TabBarViewController.Instance?.tabBAr.isHidden = true
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        childVC = storyboard.instantiateViewController(withIdentifier: "ProjectFilterViewController") as! ProjectFilterViewController
        
        
        childVC.view.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: view.frame.height)
        
        addChild(childVC)
        view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
        
        
        UIView.animate(withDuration: 0.4) {
            self.childVC.view.frame.origin.y = self.view.frame.minY
        } completion: { _ in
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !projectDetailView.isHidden {
            projectDetailView.isHidden = false
        }else{
            projectDetailView.isHidden = true
        }
        setUpnavigationForProject()
        
    }
    
    
    @IBAction func moreLessButtonAction(_ sender: UIButton) {
        
        
        //        self.projectDetailCard.frame = CGRect(x: 0, y: 0, width: self.projectDetailCard.frame.width, height: self.projectDetailCard.frame.height - 170.0)
        
        //        self.projectDetailHeight.isActive.toggle()
        
        if click{
            click = false
            
            
            UIView.animate(withDuration: 0.4, animations: {
                self.MoreLessButton.setTitle("More", for: .normal)
                //                self.deveLoperStack.isHidden = true
                self.seniourDevloperStack.isHidden = true
                
                self.QaLeadStack.isHidden = true
                self.sQAStack.isHidden = true
                self.qaManualStack.isHidden = true
                
                self.projectDetailHeight.constant = 300
                self.QaLeadStack.alpha = 0
                self.sQAStack.alpha = 0
                self.qaManualStack.alpha = 0
                
                
                
                self.view.layoutIfNeeded()
                
            },completion:  {
                (value: Bool) in
                //                self.deveLoperStack.isHidden = false
                //                self.seniourDevloperStack.isHidden = false
                
            })
            
            //            projectDetailHeight.isActive.toggle()
            
        }else
        {
            click = true
            MoreLessButton.setTitle("Less", for: .normal)
            
            self.QaLeadStack.alpha = 0
            self.sQAStack.alpha = 0
            self.qaManualStack.alpha = 0
            UIView.animate(withDuration: 0.4, animations: {
                
                self.projectDetailHeight.constant = 470
                self.QaLeadStack.alpha = 1
                self.sQAStack.alpha = 1
                self.qaManualStack.alpha = 1
                
                self.view.layoutIfNeeded()
                
            },completion:  {
                (value: Bool) in
                self.QaLeadStack.isHidden = false
                self.sQAStack.isHidden = false
                self.qaManualStack.isHidden = false
                //                self.deveLoperStack.isHidden = false
                self.seniourDevloperStack.isHidden = false
                
                
            })
            
        }
        
        
    }
    
    
    
    @IBAction func projectEditButtonClick(_ sender: Any)
    {
        TabBarViewController.Instance?.tabBAr.isHidden = true
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        childVC = storyboard.instantiateViewController(withIdentifier: "ProjectEditViewController") as! ProjectEditViewController
        
        childVC.view.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: view.frame.height)
        
        addChild(childVC)
        view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
        
        UIView.animate(withDuration: 0.4) {
            self.childVC.view.frame.origin.y = self.view.frame.minY
        } completion: { _ in
            //            self.childVC2.BlurView.isHidden = false
            //            self.childVC.editView.layer.cornerRadius = 15
            //            self.childVC.editView.layer.borderWidth = 1
            //            self.childVC.editView.clipsToBounds = true
        }
        
    }
    
    
    
    func dismissChildViewController() {
        UIView.animate(withDuration: 0.4) {
            
            self.childVC.view.frame.origin.y = self.view.frame.maxY
            
        } completion: { _ in
            TabBarViewController.Instance?.tabBAr.isHidden = false
            self.childVC.removeFromParent()
            self.childVC.view.removeFromSuperview()
        }
    }
    
    
    func setupProject(){
        projectDetailCard.layer.cornerRadius  = 15
        projectDetailCard.backgroundColor = UIColor.cardBackGroundClor.mainCard
        
        clientCard.layer.cornerRadius = 15
        SowtableView.backgroundColor = UIColor.cardBackGroundClor.mainCard
        
        sowCard.layer.cornerRadius = 15
        sowCard.backgroundColor = UIColor.cardBackGroundClor.mainCard
        
        projectEditButton.layer.cornerRadius = 15
        projectEditButton.setTitle("Edit", for: .normal)
        projectEditButton.backgroundColor = UIColor.Button.filterButton
        projectEditButton.setTitleColor(UIColor.buttonText.buttonText1, for: .normal)
    }
    
}




extension ProjectViewController: UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let card = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCell", for: indexPath) as! ProjectCollectionViewCell
        card.addprojectAttribute()
        card.projectName.text = filteredData[indexPath.row]
        card.shadow()
        return card
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        projectDetailView.isHidden = false
        projectDetailView.frame = CGRect(x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        UIView.animate(withDuration: 0.4, animations: {
            self.projectDetailView.frame = self.view.bounds
        },completion: { _ in
            //              self.employeeListCollectionView.isUserInteractionEnabled = true
        })
        
        setUpnavigationForProject()
    }
    
    
    
}


extension ProjectViewController : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let card = tableView.dequeueReusableCell(withIdentifier: "SowTableViewCell", for: indexPath) as! SowTableViewCell
        
        return card
    }
    
    
    
    
    
}

extension ProjectViewController : UISearchBarDelegate{
    
   
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            
            if searchText.isEmpty{
                filteredData = DummyData.Instance.projectName
                noDataLabel.isHidden = true
            }else{
                filteredData = DummyData.Instance.projectName.filter { $0.lowercased().contains(searchText.lowercased()) }
                
                if filteredData.isEmpty {
                    noDataLabel.text = "No Data Found"
                    noDataLabel.isHidden = false
    
                }else{
                    noDataLabel.isHidden = true
                }
               
            }
            ProjectCollectionView.reloadData()
                
            }
}
