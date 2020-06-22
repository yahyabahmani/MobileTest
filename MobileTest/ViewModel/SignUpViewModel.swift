//
//  SignUpViewModel.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
class SignUpViewModel:BaseViewModel {
    func showImage() {
        
    }
    func uniqEmail (_ email:String)->Bool {
        let realm = RealmService.shared.getDataFromDB(type: UserModel())
        if  realm.filter("email == %@",email).first != nil {
            return false
        }else{
            return true
            
        }
        
    }
    func createUser(_ userModel:UserModel) {
        guard self.uniqEmail(userModel.email) else{
            self.showError(errorString: StringHelper.errorUniqeEmail)
            return
        }
        RealmService.shared.create(userModel) { ( error) in
            if error != nil {
                self.showError(errorString: StringHelper.ErrorDB)
            }else{
                self.errorWithDismissViewController(message: StringHelper.sucess)
                
            }
        }
        
    }
}
