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
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9]).{3,}")
        return passwordTest.evaluate(with: self)
    }

        func isValidEmail() -> Bool {
            // here, `try!` will always succeed because the pattern is valid
            let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        }
    }

extension UITableView {
    func registerCell(_ name : String) {
        self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
}
extension UIView {
    class var nibName: String {
        return String(describing: self)
    }
}
extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
