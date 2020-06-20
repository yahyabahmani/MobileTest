//
//  MobileUserDefault.swift
//  MobileTest
//
//  Created by macbook on 3/30/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
class userMobile {
    static var shared = userMobile()
    private var defaults = UserDefaults.standard
    var isLoginAdmin = false {
          didSet{
              self.defaults.set(self.isLoginAdmin, forKey: isLoginAdminKey)
          }
          
      }
    var userEmail = "" {
        didSet{
            self.defaults.set(self.userEmail, forKey: UserEmail)
        }
        
    }
    private init() {
        self.userEmail = self.defaults.string(forKey: UserEmail) ?? ""
        self.isLoginAdmin = self.defaults.bool(forKey: isLoginAdminKey)
    }
    
}
fileprivate let UserEmail = "UserEmail"
fileprivate let isLoginAdminKey = "isLoginAdmin"
