//
//  SplashViewController.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {
    var viewModel : SplashViewModel?
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator.startAnimating()
        
        let realm = RealmService.shared.getDataFromDB(type: UserModel())
        let userLogin = realm.filter("isLogin == true")
        delayForSeconds(delay: 3) {
            if userLogin.count == 0 {
                self.viewModel?.showLogin()
            }else{
                
            }
        }
        
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
extension SplashViewController:InstantiatableViewControllerType{
    static var storyboardName: StoryBoardName {
        .Main
    }
    
    
    
}
