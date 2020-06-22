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
    var coordinator: Coordinatable?
    weak var delegateViewModel: BaseViewModelDelegate?
    
    func showError(errorString: String?) {
        self.delegateViewModel?.showErrorMessage(errorString ?? "")
    }
    func errorWithDismissViewController(message:String) {
        self.delegateViewModel?.showErrorMessageDismiss(message)
    }
}

protocol BaseViewModelDelegate: class {
    func showErrorMessage(_ message: String)
    func showErrorMessageDismiss(_ message: String)
    
}
extension UIViewController: BaseViewModelDelegate {
    func showErrorMessage(_ message: String) {
        Alerts.ShowAlert( message: message, vc: self, action: nil)
    }
    func showErrorMessageDismiss(_ message: String) {
        Alerts.ShowAlert( message: StringHelper.sucess, vc: self) { (alert) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
