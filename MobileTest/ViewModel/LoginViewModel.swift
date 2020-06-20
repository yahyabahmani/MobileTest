//
//  LoginViewModel.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
protocol LoginViewModelDelegate:NSObjectProtocol {
    func showAlert()
}
class LoginViewModel:BaseViewModel {
    weak var delegate :LoginViewModelDelegate?
    func signUpAction() {
        (self.coordinator as? LoginCoordinator)?.showSignUp()
    }
    
    func loginAction (_ email:String,_ password:String) {
        let realm = RealmService.shared.getDataFromDB(type: UserModel())
        if let user = realm.filter("email == %@ AND password == %@",email,password).first {
            userMobile.shared.userEmail = user.email
            (self.coordinator as? LoginCoordinator)?.userLogin(user)
            
        }else{
            self.delegate?.showAlert()
            
        }
        
        
        
    }
    func adminLogin() {
        userMobile.shared.isLoginAdmin  = true
        (self.coordinator as? LoginCoordinator)?.adminLogin()
    }
}
