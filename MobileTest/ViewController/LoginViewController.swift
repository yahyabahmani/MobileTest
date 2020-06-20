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
        
//        if userMobile.shared.userEmail.count != 0 {
//            let email = userMobile.shared.userEmail
//            let realm = RealmService.shared.getDataFromDB(type: UserModel())
//            if let user = realm.filter("email == %@",email).first {
//                self.showUser(user)
//            }
//            
//
//        }
//        if userMobile.shared.isLoginAdmin == true {
//            self.viewModel?.adminLogin()
//        }
        // Do any additional setup after loading the view.
    }
    

     @IBAction func signUpAction(_ sender: Any) {
        self.viewModel?.signUpAction()
     
     }
    fileprivate func showUser(_ user:UserModel) {
        userMobile.shared.userEmail = user.email
        self.viewModel?.loginAction(user )
    }
    fileprivate func showPrimaryUser(_ user: Results<UserModel>) {
        if let primaryUser = user.first {
            self.showUser(primaryUser)
        }
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
        let realm = RealmService.shared.getDataFromDB(type: UserModel())
             let user = realm.filter("email == %@ AND password == %@",email,password)
            if  user.count == 0{
                Alerts.ShowAlert( message: StringHelper.errorInLogin, vc: self)
            }else{
                showPrimaryUser(user)
            }

            
        }
    }
    
}
extension LoginViewController:InstantiatableViewControllerType{
static var storyboardName: StoryBoardName {
    .Login
}
}
