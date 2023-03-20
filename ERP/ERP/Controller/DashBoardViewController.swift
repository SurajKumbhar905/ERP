//
//  DashBoardViewController.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import UIKit

class DashBoardViewController: BaseViewController {
    

 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        print("dashboard")
        navigationItem.title = ""
        setupNAvigationToMainScreen(backButtonHide: true)
       
    }

}

extension DashBoardViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return DummyData.Instance.cardCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = collectionView.dequeueReusableCell(withReuseIdentifier: "MainScreenCell", for: indexPath) as! DashBoardCollectionViewCell
        
        card.addAttibute(indexPath: indexPath)
        
        return card
    }
    
    
   
}

