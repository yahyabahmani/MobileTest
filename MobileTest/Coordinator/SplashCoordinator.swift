//
//  SplashCoordinator.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
import UIKit
class SplashCoordinator:Coordinatable {
    var rootViewController: UIViewController
    var appWindow:UIWindow
    init(with window:UIWindow) {
        self.appWindow = window
        let vc = SplashViewController.instantiate()
        self.rootViewController =  vc
        let viewModel = SplashViewModel()
        vc.viewModel = viewModel
        viewModel.coordinator = self
        viewModel.delegate = vc
    }
        
    func showList() {
        
    }
    func showLogin() {
        LoginCoordinator.init().coordinate(to: appWindow)
    }
}
