//
//  Coordinatable.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinatable:class {
    var rootViewController: UIViewController { get set }

     func coordinate(to window: UIWindow)
       func coordinate(to viewController: UIViewController)
}
extension Coordinatable {
func coordinate(to viewController: UIViewController) {
    //viewController.present(rootViewController, animated: true)
    viewController.show(self.rootViewController, sender: nil)
}
    
    func coordinate(to window: UIWindow) {
        window.rootViewController = self.rootViewController
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {}, completion: nil)
        //self.present(rootViewController, animated: true)

    }
}
