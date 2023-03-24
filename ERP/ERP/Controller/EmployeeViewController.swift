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
    
    @IBOutlet var employeeDetailScrollView: UIScrollView!
    
    @IBOutlet var employeeListCollectionView: UICollectionView!
    
    
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
        
//        employeeDetailScrollView.translatesAutoresizingMaskIntoConstraints = false
//        employeeDetailView.backgroundColor = .red
////        let topConstraint = NSLayoutConstraint(item: employeeDetailView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 20.0)
//        let bottomConstraint = NSLayoutConstraint(item: employeeDetailScrollView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -20.0)
////        let leadingConstraint = NSLayoutConstraint(item: employeeDetailView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 20.0)
////        let trailingConstraint = NSLayoutConstraint(item: employeeDetailView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -20.0)
//        NSLayoutConstraint.activate([ bottomConstraint])
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        employeeDetailScrollView.isHidden = true
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
    
    
    
    func pushToNew(identifier : String){
         let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
         
        vc.view.frame = CGRect(x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.addChild(vc)
       self.view.addSubview(vc.view)
       vc.view.tag = 90
       
       UIView.animate(withDuration: 0.5, animations: {
       vc.view.frame = self.view.bounds
        })

    
       
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
        
        
        if collectionView == self.employeeprojectCollectionView{
            
        }
        else
        {
            view.bringSubviewToFront(employeeDetailScrollView)
            employeeListCollectionView.isUserInteractionEnabled = false
            employeeDetailScrollView.setContentOffset(.zero, animated: false)
//            self.scrollView.setContentOffset(
//            CGPoint(x: 0,y: -self.scrollView.contentInset.top),
//            animated: true)
//            employeeDetailScrollView.
            employeeprojectCollectionView.scrollToItem(at: [0,0], at: .right, animated: true)
            
    //        pushToNew(identifier: "TestViewController")
            
            employeeDetailScrollView.isHidden = false
            employeeDetailView.frame = CGRect(x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            UIView.animate(withDuration: 0.3, animations: {
                self.employeeDetailView.frame = self.view.bounds
             },completion: { _ in
                                     self.employeeListCollectionView.isUserInteractionEnabled = true
                                 })
//
            
            setUpNavigation()
            selectedIndexPath = indexPath
        }
        
        
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        // Always return false to prevent deselection
        return false
    }
    
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
           
//           let movedItem = myDataSource.remove(at: sourceIndexPath.item)
//           myDataSource.insert(movedItem, at: destinationIndexPath.item)
//
           collectionView.reloadData()
       }
    
    
    
    
    
}


extension UIViewController{
    
    class func loadViewController(withStoryBoard storyBoardName: String = "Main") -> Self

        {

            return instantiateViewController(withStoryBoard: storyBoardName)

        }

        

        class func instantiateViewController<T>(withStoryBoard storyBoardName: String) -> T

        {

            let sb: UIStoryboard = UIStoryboard(name: storyBoardName, bundle: nil)

            let controller  = sb.instantiateViewController(withIdentifier: String(describing: self)) as! T

            return controller

        }

   
}
