//
//  ProjectViewController.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import UIKit

class ProjectViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Project"
        
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        setUpnavigationForProject()

    }

}


extension ProjectViewController: UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let card = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCell", for: indexPath) as! ProjectCollectionViewCell
//        card.addprojectAttribute()
        
        return card
    }
    
    
    
    
}
