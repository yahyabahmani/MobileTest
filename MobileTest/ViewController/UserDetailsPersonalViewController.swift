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
    
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var fullNameTextFeild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextFeild.text = userModel?.email
        self.fullNameTextFeild.text = userModel?.fullName

    }
    
    @IBAction func updateButton(_ sender: Any) {
        guard let userModel = userModel else{return}
        if fullNameTextFeild.text != userModel.fullName || emailTextFeild.text != emailTextFeild.text {
            let image =  (self.imageButton.image(for: .normal)) ?? UIImage()
              let imageData = image.jpeg(.medium) ?? Data()

            RealmService.shared.update(userModel , with: ["fullName":fullNameTextFeild.text,"emailTextFeild":emailTextFeild.text,"image":imageData]) { (error) in
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
    func logout()  {
        userMobile.shared.userEmail = ""
        self.dismiss(animated: true, completion: nil)
    }

}
extension UserDetailsPersonalViewController:InstantiatableViewControllerType{
    static var storyboardName: StoryBoardName {
        .List
    }
}
