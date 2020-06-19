//
//  Extention.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//
import UIKit
import Foundation
    
    public func delayForSeconds(delay: Double, completion: @escaping() -> ()) {
        let timer = DispatchTime.now() + delay
        
        DispatchQueue.main.asyncAfter(deadline: timer) {
            completion()
        }
    }
    
class Alerts:NSObject {
    
    class func ShowAlert(title:String = "",message :String = "",vc:UIViewController,  action: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
  
        let okAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default,handler: action)
        
        
        alert.addAction(okAction)
        OperationQueue.main.addOperation {
            vc.present(alert, animated: true, completion: nil)
        }
}
}
extension String {
    func isValidPassword() -> Bool {
//
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9]).{3,}")
        return passwordTest.evaluate(with: self)
    }
}
