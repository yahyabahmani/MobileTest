//
//  UserDetailsPersonalViewController.swift
//  MobileTest
//
//  Created by macbook on 3/30/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import UIKit

class UserDetailsPersonalViewController: UIViewController {
    var viewModel:UserDetailsPersonalViewModel?
    var userModel:UserModel?
    
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var fullNameTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = userModel?.email
        self.imageButton.layer.cornerRadius = self.imageButton.frame.width / 2
        self.imageButton.layer.masksToBounds = true
        self.passwordTextFeild.text = userModel?.password
        self.fullNameTextFeild.text = userModel?.fullName
        self.imageButton.setImage(UIImage(data: userModel?.image ?? Data()), for: .normal)
        
    }
    
    @IBAction func updateButton(_ sender: Any) {
        guard let userModel = userModel else{return}
        if fullNameTextFeild.text != userModel.fullName || passwordTextFeild.text != userModel.password {
            let image =  (self.imageButton.image(for: .normal)) ?? UIImage()
            let imageData = image.jpeg(.medium) ?? Data()
            
            RealmService.shared.update(userModel , with: ["fullName":fullNameTextFeild.text,"password":passwordTextFeild.text,"image":imageData]) { (error) in
                if error == nil {
                    Alerts.ShowAlert( message: StringHelper.sucess, vc: self)
                }
            }
        }
        
        
    }
    @IBAction func deleteButton(_ sender: Any) {
        guard let usermodel = self.userModel else{return}
        RealmService.shared.delete(usermodel) { (error) in
            if error == nil {
                Alerts.ShowAlert( message: StringHelper.DeleteUser, vc: self) { (action) in
                    self.logout()
                }
            }
        }
        
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        self.logout()
    }
    func logout()  {
        userMobile.shared.userEmail = ""
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageButton(_ sender: Any) {
        ImagePickerManager().pickImage(self) { (image) in
            self.imageButton.setImage(image, for: .normal)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
extension UserDetailsPersonalViewController:InstantiatableViewControllerType{
    static var storyboardName: StoryBoardName {
        .List
    }
}
