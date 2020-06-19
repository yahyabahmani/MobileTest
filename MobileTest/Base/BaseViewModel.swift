//
//  BaseViewModel.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
import UIKit

class BaseViewModel {
    weak var delegate: BaseViewModelDelegate?
    var coordinator: Coordinatable?
    
    func showError(errorString: String?) {

    }
}

protocol BaseViewModelDelegate: class {
    func showVC(_ viewController: UIViewController)
    func presentVC(_ viewController: UIViewController)
    func popVC(_ animated: Bool)
}
extension UIViewController: BaseViewModelDelegate {
    func showVC(_ viewController: UIViewController) {
        self.show(viewController, sender: nil)
    }
    
    func presentVC(_ viewController: UIViewController) {
        self.present(viewController, animated: true)
    }
    
    func popVC(_ animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }
}
