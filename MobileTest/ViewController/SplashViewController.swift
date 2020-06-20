//
//  SplashViewController.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {
    var viewModel : SplashViewModel?
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator.startAnimating()
        
        delayForSeconds(delay: 3) {
            if userMobile.shared.userEmail.count != 0 {
                self.showHomeUser()
            }
            if userMobile.shared.isLoginAdmin == true {
                self.viewModel?.showAdminLogin()
            }else{
                self.viewModel?.showLogin()
            }
        }
        // Do any additional setup after loading the view.
    }
    

    func showHomeUser() {
        let email = userMobile.shared.userEmail
        let realm = RealmService.shared.getDataFromDB(type: UserModel())
        if let user = realm.filter("email == %@",email).first {
            self.viewModel?.showuserLogin(user)
            
        }
    }
}
    extension SplashViewController:InstantiatableViewControllerType{
        static var storyboardName: StoryBoardName {
            .Main
        }
        
        
        
}
