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
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        delayForSeconds(delay: 1) {
            self.viewModel?.showDirect()
        }
    }
}
extension SplashViewController:InstantiatableViewControllerType{
    static var storyboardName: StoryBoardName {
        .Main
    }
    
    
    
}
