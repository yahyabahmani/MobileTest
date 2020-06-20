//
//  UserDetailsPersonalCoordinator.swift
//  MobileTest
//
//  Created by macbook on 3/30/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import UIKit

class UserDetailsPersonalCoordinator: Coordinatable {
    var rootViewController: UIViewController
    
    init(_ user:UserModel) {
        let vc = UserDetailsPersonalViewController.instantiate()
        self.rootViewController = vc
        let viewModel = UserDetailsPersonalViewModel()
        vc.viewModel = viewModel
        vc.userModel = user
        viewModel.coordinator = self
    }
}
