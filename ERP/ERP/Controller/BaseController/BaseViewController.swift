//
//  BaseViewController.swift
//  ERP
//
//  Created by Suraj on 19/03/23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func setupNAvigationToMainScreen(backButtonHide : Bool = false) {

//
//        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 22)!]
//        UINavigationBar.appearance().titleTextAttributes = attributes
        
//        self.navigationController?.navigationBar.backgroundColor =  UIColor.green
        
       

        let backButtonView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let profileView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        let backimageView = UIImageView(frame: CGRect(x: 20, y: 10, width: 20, height: 30))
        
        let profileImageView = UIImageView(frame: CGRect(x: -10, y: 0, width: 60, height: 60))

        if let imgBackArrow = UIImage(named: "backArrow") {
            backimageView.image = imgBackArrow
        }
        
        if let imageProfile = UIImage(named: "Profile_for_main") {
            profileImageView.image = imageProfile
        }
        
        backButtonView.addSubview(backimageView)
        
        let badge = UILabel(frame: CGRect(x: -10, y: 40, width: 20, height: 20))
        badge.text = "2"
        badge.font = UIFont.systemFont(ofSize: 14.0)
        badge.backgroundColor = UIColor.black
        badge.textColor = UIColor.white
        badge.layer.cornerRadius = badge.frame.height/2
        badge.layer.masksToBounds = true
        
//        badge.sizeToFit()
        badge.textAlignment = .center
        
//        profileView.addSubview(badge)
        profileView.addSubview(profileImageView)
        profileView.addSubview(badge)
        
        let backTap = UITapGestureRecognizer(target: self, action: #selector(backToMain))
        view.addGestureRecognizer(backTap)

        self.navigationItem.setHidesBackButton(true, animated: true)
        let leftBarButtonItem = UIBarButtonItem(customView: backButtonView )
        let rightBarButtonItem = UIBarButtonItem(customView: profileView )
        if !backButtonHide {
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
        }
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
//        addBadge(itemvalue: "2")
        
        
        
        
    }
    
   @objc func backToMain(){
//       tabBarItem[0]
    }
    
    
//    func addBadge(itemvalue: String) {
//
//            let bagButton = BadgeButton()
//        bagButton.backgroundColor = UIColor.black
//            bagButton.frame = CGRect(x: 0, y: 0, width:5, height: 5)
//            bagButton.tintColor = UIColor.darkGray
////        bagButton.setImage(UIImage(named: "Profile_for_main")?.withRenderingMode(.automatic), for: .normal)
//            bagButton.badgeEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 15)
//            bagButton.badge = itemvalue
//            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: bagButton)
//        }
//
//    @objc func back(sender: UIBarButtonItem) {
//                // Perform your custom actions
//                // ...
//                // Go back to the previous ViewController
//                self.navigationController?.popViewControllerAnimated(true)
//            }
    
   
}




//class BadgeButton: UIButton {
//
//    var badgeLabel = UILabel()
//
//    var badge: String? {
//        didSet {
//            addbadgetobutton(badge: badge)
//        }
//    }
//
//    public var badgeBackgroundColor = UIColor.red {
//        didSet {
//            badgeLabel.backgroundColor = badgeBackgroundColor
//        }
//    }
//
//    public var badgeTextColor = UIColor.white {
//        didSet {
//            badgeLabel.textColor = badgeTextColor
//        }
//    }
//
//    public var badgeFont = UIFont.systemFont(ofSize: 12.0) {
//        didSet {
//            badgeLabel.font = badgeFont
//        }
//    }
//
//    public var badgeEdgeInsets: UIEdgeInsets? {
//        didSet {
//            addbadgetobutton(badge: badge)
//        }
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addbadgetobutton(badge: nil)
//    }
//
//    func addbadgetobutton(badge: String?) {
//        badgeLabel.text = badge
//        badgeLabel.textColor = badgeTextColor
//        badgeLabel.backgroundColor = badgeBackgroundColor
//        badgeLabel.font = badgeFont
//        badgeLabel.sizeToFit()
//        badgeLabel.textAlignment = .center
//        let badgeSize = badgeLabel.frame.size
//
//        let height = max(18, Double(badgeSize.height) + 5.0)
//        let width = max(height, Double(badgeSize.width) + 10.0)
//
//        var vertical: Double?, horizontal: Double?
//        if let badgeInset = self.badgeEdgeInsets {
//            vertical = Double(badgeInset.top) - Double(badgeInset.bottom)
//            horizontal = Double(badgeInset.left) - Double(badgeInset.right)
//
//            let x = (Double(bounds.size.width) - 10 + horizontal!)
//            let y = -(Double(badgeSize.height) / 2) - 10 + vertical!
//            badgeLabel.frame = CGRect(x: x, y: y, width: width, height: height)
//        } else {
//            let x = self.frame.width - CGFloat((width / 2.0))
//            let y = CGFloat(-(height / 2.0))
//            badgeLabel.frame = CGRect(x: x, y: y, width: CGFloat(width), height: CGFloat(height))
//        }
//
//        badgeLabel.layer.cornerRadius = badgeLabel.frame.height/2
//        badgeLabel.layer.masksToBounds = true
//        addSubview(badgeLabel)
//        badgeLabel.isHidden = badge != nil ? false : true
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.addbadgetobutton(badge: nil)
//        fatalError("init(coder:) is not implemented")
//    }
//}
