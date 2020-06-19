//
//  AdminListViewController.swift
//  MobileTest
//
//  Created by macbook on 3/30/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import UIKit

class AdminListViewController: BaseViewController {
    
    @IBOutlet weak var table: UITableView!
    
    
    var viewModel : AdminViewModel?
    var userModel = [UserModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userModel = Array(RealmService.shared.getDataFromDB(type: UserModel()))
        // Do any additional setup after loading the view.
        self.table.registerCell(AdminListTableViewCell.nibName)
    }
    


}

extension AdminListViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.userModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AdminListTableViewCell.nibName) as! AdminListTableViewCell
        cell.fill(self.userModel[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let object = self.userModel[indexPath.row]
            RealmService.shared.delete(object) { (error) in
                if error != nil {
                    Alerts.ShowAlert( message: StringHelper.ErrorDB, vc: self)
                    return
                }
                self.userModel = Array(RealmService.shared.getDataFromDB(type: UserModel()))
                         DispatchQueue.main.async {
                            self.table.reloadData()
                        }
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
extension AdminListViewController:InstantiatableViewControllerType{
    static var storyboardName: StoryBoardName {
        .List
    }
}
