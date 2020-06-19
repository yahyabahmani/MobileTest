//
//  UserModel.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
import RealmSwift
class UserModel:Object {
    @objc dynamic var fullName = ""
    @objc dynamic var email = ""
    @objc dynamic var image = Data()
    @objc dynamic var password = ""
    @objc dynamic var usreType = UserType.personal.rawValue
    @objc dynamic var isLogin = false


    override static func primaryKey() -> String? {
          return "email"
        
      }
    convenience init(_ fullName:String,_ email:String,_ image:Data,password:String,userType:UserType) {
        self.init()
        self.fullName = fullName
        self.email = email
        self.image = image
        self.usreType = userType.rawValue
    }
    
}
    
 enum UserType : String {
    case personal = "personal"
    case admin = "admin"
}
