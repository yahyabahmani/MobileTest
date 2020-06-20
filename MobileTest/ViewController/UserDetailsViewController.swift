//
//  UserDetailsViewController.swift
//  MobileTest
//
//  Created by macbook on 3/30/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    var viewModel:UserDetailsViewModel?
    @IBOutlet weak var fullNameTextFeild: UITextField!
    
    @IBOutlet weak var userimageView: UIImageView!
    @IBOutlet weak var emailTextFeild: UITextField!
    
    var userModel : UserModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fullNameTextFeild.text = userModel?.fullName
        self.emailTextFeild.text = userModel?.email
        self.userimageView.image =  UIImage(data: userModel?.image ?? Data())
        self.fullNameTextFeild.isUserInteractionEnabled = false
        self.emailTextFeild.isUserInteractionEnabled = false
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UserDetailsViewController:InstantiatableViewControllerType{
    static var storyboardName: StoryBoardName {
        .List
    }
}
