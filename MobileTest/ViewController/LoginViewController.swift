//
//  LoginViewController.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    var viewModel :LoginViewModel?
    
    @IBOutlet weak var userNameTextFeild: UITextField!
    
    
    @IBOutlet weak var passwordTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

     @IBAction func signUpAction(_ sender: Any) {
        self.viewModel?.signUpAction()
     
     }
    @IBAction func loginAction(_ sender: Any) {
    }
    
}
extension LoginViewController:InstantiatableViewControllerType{
static var storyboardName: StoryBoardName {
    .Login
}
}
