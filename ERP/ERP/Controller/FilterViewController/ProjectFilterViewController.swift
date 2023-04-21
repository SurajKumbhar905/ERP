//
//  ProjectFilterViewController.swift
//  ERP
//
//  Created by Suraj on 20/04/23.
//

import UIKit

class ProjectFilterViewController: UIViewController {
    

    @IBOutlet var projectFilterCard: UIView!
    @IBOutlet var projectFilterScrollView: UIScrollView!
    @IBOutlet var projectFilterView: UIView!
    
    @IBOutlet var BlurView: UIView!
    
    @IBOutlet var teamSizeView: UIView!
    @IBOutlet var teamSizeLabel: UILabel!
    @IBOutlet var teamZiseTable: UITableView!
    @IBOutlet var teamSizeTableHeight: NSLayoutConstraint!
    
    
    @IBOutlet var statusView: UIView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var statusTable: UITableView!
    @IBOutlet var sttusTableHeight: NSLayoutConstraint!
    
    
    @IBOutlet var applayButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var crossButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        projectFilterCard.clipsToBounds = true
        projectFilterCard.layer.cornerRadius = 15
        
        let blurTap = UITapGestureRecognizer(target: self, action: #selector(self.blurViewTapHandle(_:)))
        BlurView.addGestureRecognizer(blurTap)
        
        
        
        teamZiseTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        teamZiseTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        
        statusTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        statusTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
        
        
        
        setUpFilters()
        
        
    }
    

    
   
    @IBAction func crossButtonClick(_ sender: Any)
    {
        BlurView.isHidden = true
        if let parentVC = parent as? ProjectViewController {
            parentVC.dismissChildViewController()
        }
    }
    
    @IBAction func resetButtonClick(_ sender: Any)
    {
        
        constentData.projectFilterStatus = "All"
        constentData.ProjectTeamSize = "All"
        
        teamSizeLabel.text = constentData.ProjectTeamSize
        statusLabel.text = constentData.projectFilterStatus
    }
    
    
    @IBAction func applyVuttonClick(_ sender: Any)
    {
        
    }
    
}



extension ProjectFilterViewController {
    
    func setUpFilters(){
        
        teamSizeLabel.text = constentData.ProjectTeamSize
        statusLabel.text = constentData.projectFilterStatus
        
        let teamSizeTap = UITapGestureRecognizer(target: self, action: #selector(self.teamSizeTapHandel(_:)))
        teamSizeView.addGestureRecognizer(teamSizeTap)
        self.teamSizeTableHeight.constant = 0
        
        
        let statusTap = UITapGestureRecognizer(target: self, action: #selector(self.statusTapHandel(_:)))
        statusView.addGestureRecognizer(statusTap)
        self.sttusTableHeight.constant = 0
        
    }
}


extension ProjectFilterViewController{
    
    @objc func blurViewTapHandle(_ sender: UITapGestureRecognizer? = nil) {
        BlurView.isHidden = true
        if let parentVC = parent as? ProjectViewController {
            parentVC.dismissChildViewController()
        }
    }
    
    
    @objc func teamSizeTapHandel(_ sender: UITapGestureRecognizer? = nil) {
        

        UIView.animate(withDuration: 0.4, animations: {
            
            if self.teamSizeTableHeight.constant == 120
            {
                self.teamSizeTableHeight.constant = 0
            }else
            {
                self.teamSizeTableHeight.constant = 120
                self.sttusTableHeight.constant = 0
            }
            self.view.layoutIfNeeded()

            })
        
    }
    
    
    @objc func statusTapHandel(_ sender: UITapGestureRecognizer? = nil) {
        

        UIView.animate(withDuration: 0.4, animations: {
            if self.sttusTableHeight.constant == 120
            {
                self.sttusTableHeight.constant = 0
            }else
            {
                self.sttusTableHeight.constant = 120
                self.teamSizeTableHeight.constant = 0
            }

            self.view.layoutIfNeeded()

            })
        
    }
    
}



extension ProjectFilterViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == teamZiseTable {
            return DummyData.Instance.teamSizeCount()
        }
        else{
            return DummyData.Instance.statusCount()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        
        
        if tableView == teamZiseTable
        {
            cell.cellLabel.text = DummyData.Instance.teamSize[indexPath.row]
        }else
        {
            cell.cellLabel.text = DummyData.Instance.status[indexPath.row]
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == teamZiseTable
        {
            UIView.animate(withDuration: 0.4, animations: { [self] in
                constentData.ProjectTeamSize = DummyData.Instance.teamSize[indexPath.row]
                teamSizeLabel.text =  constentData.ProjectTeamSize
                teamSizeTableHeight.constant = 0
                self.view.layoutIfNeeded()

                })
            
        }
        else
        {
            
            UIView.animate(withDuration: 0.4, animations: { [self] in
                
                constentData.projectFilterStatus = DummyData.Instance.status[indexPath.row]
                statusLabel.text = constentData.projectFilterStatus
                sttusTableHeight.constant = 0
                self.view.layoutIfNeeded()
                })
        }
    }
    
    
}
