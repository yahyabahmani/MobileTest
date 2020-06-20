//
//  SignUpCoordinator.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
import UIKit
class SignUpCoordinator: Coordinatable {
    var rootViewController: UIViewController
    
    init() {
        let vc = SignUpViewController.instantiate()
        self.rootViewController = vc
        let viewModel = SignUpViewModel()
        vc.viewModel = viewModel
        viewModel.coordinator = self
    }
    
    
}
