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
        delayForSeconds(delay: 2) {
            let realm = RealmService.shared.getDataFromDB(type: UserModel())
            if realm.count == 0 {
                self.showLogin()
            }else{
                
            }
        }
        
    }
    func showAdminLogin() {
        (self.coordinator as? SplashCoordinator)?.adminLogin()
    }
    func showuserLogin (_ user:UserModel) {
        (self.coordinator as? SplashCoordinator)?.userLogin(user)
    }
    func showLogin() {
        (self.coordinator as? SplashCoordinator)?.showLoginPage()
        
    }
    
}
