//
//  LoginViewController.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import UIKit
import RealmSwift
class LoginViewController: BaseViewController {
   
    
    var viewModel :LoginViewModel?
    
    @IBOutlet weak var userNameTextFeild: UITextField!
    
    
    @IBOutlet weak var passwordTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.delegate = self
    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        self.viewModel?.signUpAction()
        
    }
    
    
    
    @IBAction func loginAction(_ sender: Any) {
        guard let email = self.userNameTextFeild.text else {
            Alerts.ShowAlert( message: StringHelper.EmailError, vc: self)
            return
        }
        guard let password = self.passwordTextFeild.text else {
            Alerts.ShowAlert( message: StringHelper.passwordIsnotStrong, vc: self)
            return
        }
        if userNameTextFeild.text == "admin" && passwordTextFeild.text == "admin" {
            self.viewModel?.adminLogin()
        }else{
            self.viewModel?.loginAction(email, password)
            
            
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.passwordTextFeild.text = ""
        self.userNameTextFeild.text = ""
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
extension LoginViewController:LoginViewModelDelegate {
    func showAlert() {
        Alerts.ShowAlert( message: StringHelper.errorInLogin, vc: self)
    }
    
    
}
extension LoginViewController:InstantiatableViewControllerType{
    static var storyboardName: StoryBoardName {
        .Login
    }
}
