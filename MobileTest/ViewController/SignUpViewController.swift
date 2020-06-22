//
//  SignUpViewController.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    var viewModel:SignUpViewModel?
    
    @IBOutlet weak var imageButton: UIButton!
    
    @IBOutlet weak var fullnameTextFeild: UITextField!
    
    @IBOutlet weak var emailsTextFeild: UITextField!
    @IBOutlet weak var confirmPAssword: UITextField!
    
    @IBOutlet weak var passwordTextFeild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageButton.layer.cornerRadius = imageButton.frame.width / 2
        imageButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func imageButtonAction(_ sender: Any) {
        ImagePickerManager().pickImage(self) { (image) in
            self.imageButton.setImage(image, for: .normal)
        }
    }
    @IBAction func signupAction(_ sender: Any) {
        var fullName = ""
        var email = ""
        var password = ""
        fullName = self.fullnameTextFeild.text ?? ""
        guard fullName.count != 0 else{
            Alerts.ShowAlert(title: "", message: StringHelper.fullNameError, vc: self)
            return
        }
        email = self.emailsTextFeild.text ?? ""
        guard email.count != 0  && email.isValidEmail() else{
            Alerts.ShowAlert(title: "", message: StringHelper.EmailError, vc: self)
            return
        }
        password = self.passwordTextFeild.text ?? ""
        let confrimPassword = self.confirmPAssword.text
        guard password == confrimPassword else{
            Alerts.ShowAlert(title: "", message: StringHelper.confrimPassword, vc: self)
            
            return
        }
        
        guard password.isValidPassword() else{
            
            Alerts.ShowAlert(title: "", message: StringHelper.passwordIsnotStrong, vc: self)
            return
        }
        let image =  (self.imageButton.image(for: .normal)) ?? UIImage()
        let imageData = image.jpeg(.medium) ?? Data()
        
        let userModel = UserModel(fullName, email, imageData, password: password, userType: .personal)
        self.viewModel?.createUser(userModel)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
extension SignUpViewController:InstantiatableViewControllerType{
    static var storyboardName: StoryBoardName {
        .Login
    }
}
