//
//  ProfilePageViewController.swift
//  ERP
//
//  Created by Suraj on 09/05/23.
//

import UIKit
import SkeletonView

class ProfilePageViewController: UIViewController {
    
    
    @IBOutlet var notificationTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = .red
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))

            navigationItem.leftBarButtonItem = backButton
        
        self.navigationItem.title = "Profile"

                let attributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:UIFont(name: "Verdana", size: 25)]
                self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]

        
        self.view.isSkeletonable = true
        self.notificationTableView.isSkeletonable = true
//        view.showAnimatedGradientSkeleton()
        notificationTableView.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        notificationTableView.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        
        
//        view.showAnimatedGradientSkeleton(usingGradient: gradient, transition: .crossDissolve(transitionDurationStepper.value))
        
    }
    

    @objc func backButtonTapped() {
        TabBarViewController.Instance?.tabBAr.isHidden = false
        navigationController?.popViewController(animated: true)
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        self.notificationTableView.isSkeletonable = true
        notificationTableView.showAnimatedGradientSkeleton()
    }
  
    
    
}


extension ProfilePageViewController: SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "FilterTableViewCell"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
//        cell.label1.text = "cell -> \(indexPath.row)"
        
//        cell.cellLabel.text = "1"
        return cell
    }
    
    
    
    
   
  
    func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        let cell = skeletonView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as? FilterTableViewCell
        cell?.cellLabel.isHidden = indexPath.row == 0
        return cell
    }

    func collectionSkeletonView(_ skeletonView: UITableView, prepareCellForSkeleton cell: UITableViewCell, at indexPath: IndexPath) {
        let cell = cell as? FilterTableViewCell
        cell?.cellLabel.isHidden = indexPath.row == 0
    }
}
