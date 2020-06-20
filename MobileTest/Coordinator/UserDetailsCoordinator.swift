//
//  UserDetailsCoordinator.swift
//  MobileTest
//
//  Created by macbook on 3/30/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
import UIKit
class UserDetailsCoordinaor:Coordinatable{
    var rootViewController: UIViewController
    
    init(_ user:UserModel) {
    let vc = UserDetailsViewController.instantiate()
    self.rootViewController = vc
    let viewModel = UserDetailsViewModel()
    vc.viewModel = viewModel
        vc.userModel = user
    viewModel.coordinator = self
    viewModel.delegate = vc
}
}
