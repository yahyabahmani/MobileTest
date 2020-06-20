//
//  SplashViewModel.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
class SplashViewModel: BaseViewModel {
    
    override init() {
    super.init()
    }
    func showDirect() {
        if userMobile.shared.userEmail.count != 0 {
             self.showUserLogin()
         }else if userMobile.shared.isLoginAdmin == true {
             self.showAdminLogin()
         }else{
             self.showLogin()
         }
    }
    func showAdminLogin() {
        (self.coordinator as? SplashCoordinator)?.adminLogin()
    }
    func showUserLogin () {
        let email = userMobile.shared.userEmail
        let realm = RealmService.shared.getDataFromDB(type: UserModel())
        if let user = realm.filter("email == %@",email).first {
            (self.coordinator as? SplashCoordinator)?.userLogin(user)
        }
    }
    
    func showLogin() {
        (self.coordinator as? SplashCoordinator)?.showLoginPage()
        
    }
    
}
