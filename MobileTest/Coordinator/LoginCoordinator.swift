//
//  LoginCoordinator.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinatable {
    var rootViewController: UIViewController
    
    init() {
        let vc = LoginViewController.instantiate()
        self.rootViewController = vc
        let viewModel = LoginViewModel()
        vc.viewModel = viewModel
        viewModel.coordinator = self
        viewModel.delegate = vc
    }
    func showSignUp() {
        SignUpCoordinator.init().coordinate(to: rootViewController)
    }
    func adminLogin() {
        AdminListCoordinator.init().coordinate(to: rootViewController)
    }
    func userLogin(_ user:UserModel) {
        UserDetailsPersonalCoordinator.init(user).coordinate(to: rootViewController)
    }
}
