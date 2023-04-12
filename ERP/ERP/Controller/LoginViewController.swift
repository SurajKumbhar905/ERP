//
//  ViewController.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    
    
    @IBOutlet var userNameTextFeild: UITextField!
    @IBOutlet var passwordTextFeild: UITextField!
    
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var loginWithEmsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        usernameLabel.textColor = UIColor.text.textColorLevel2
        passwordLabel.textColor = UIColor.text.textColorLevel2



        userNameTextFeild.addTextFieldAttriute(placeholder: Constant.Login.usernamePlaceHolder, backgroundColor: UIColor.textFeildBackground.textFeild, cornerRedius: 12)
        passwordTextFeild.addTextFieldAttriute(placeholder: Constant.Login.passwordPlaceholder, backgroundColor: UIColor.textFeildBackground.textFeild, cornerRedius: 12)



        loginButton.addButtonAttribute(buttonText: Constant.Login.loginButtonText, conrnerRedius: 15, backGroundColor: UIColor.Button.loginButton, buttonTextColor: UIColor.buttonText.buttonText1 , buttonTextFont: 22)

        loginWithEmsButton.addButtonAttribute(buttonText: Constant.Login.loginButtonTextEms, conrnerRedius: 15, backGroundColor: UIColor.Button.loginWithEMS, buttonTextColor: UIColor.buttonText.buttonText2 , buttonTextFont: 22)
        
        
    }

    @IBAction func loginButtonClick(_ sender: Any) {
        
        
        let tabBarViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        
        self.navigationController?.pushViewController(tabBarViewController, animated: true)
       
    }
    
    
}

