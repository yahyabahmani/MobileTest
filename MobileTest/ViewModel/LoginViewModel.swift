//
//  LoginViewModel.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
class LoginViewModel:BaseViewModel {
    func signUpAction() {
        (self.coordinator as? LoginCoordinator)?.showSignUp()
        
    }
    func loginAction () {
        
    }
}
