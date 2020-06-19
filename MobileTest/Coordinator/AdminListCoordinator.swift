//
//  AdminListCoordinator.swift
//  MobileTest
//
//  Created by macbook on 3/30/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
import UIKit
class  AdminListCoordinator: Coordinatable {
    var rootViewController: UIViewController
    
    init() {
        let nc = AdminListViewController.instantiateNC()
        let vc = nc.viewControllers.first as! AdminListViewController
        self.rootViewController = nc
        let viewModel = AdminViewModel()
        vc.viewModel = viewModel
        viewModel.coordinator = self
        viewModel.delegate = vc
    }
}
